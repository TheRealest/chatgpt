# frozen_string_literal: true

# Manages conversation data via YAML files stored in the /conversations directory. Each YAML file
# represents one conversation and holds a list of messages in chronological order. Each message has
# two fields: role and content.

require 'yaml'
require_relative 'api'

module ChatGPT
  class Conversation
    YAML_DIRECTORY = 'conversations/'
    VALID_ROLES = %w[system assistant user].freeze

    attr_reader :name, :messages, :debug

    def initialize(name, debug: false)
      @name = name
      @messages = YAML.load_file("#{YAML_DIRECTORY}#{name}.yml")
      @debug = debug
    end

    def get_next_message
      response = API.send_messages(messages)
      ap response if debug

      add_message response.dig('choices', 0, 'message')
    end

    def add_message(message)
      raise ArgumentError, 'Invalid role' unless VALID_ROLES.include?(message['role'])

      @messages << message
      write_to_file
    end

    def write_to_file
      File.write("#{YAML_DIRECTORY}#{name}.yml", @messages.to_yaml)
    end

    def self.all_conversation_metadata
      names = Dir.glob("#{YAML_DIRECTORY}*.yml").map { |file| File.basename(file, '.yml') }
      names.map do |name|
        convo = Conversation.new(name)
        {
          name: name,
          message_count: convo.messages.length,
          last_role: convo.messages.last['role'],
          last_updated: File.mtime("#{YAML_DIRECTORY}#{name}.yml")
        }
      end
    end
  end
end
