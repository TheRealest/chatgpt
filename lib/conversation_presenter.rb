# frozen_string_literal: true

require 'rainbow'
require_relative 'conversation'

module ChatGPT
  class ConversationPresenter
    ROLE_TO_COLOR_MAP = {
      'system' => :red,
      'assistant' => :yellow,
      'user' => :green
    }.freeze

    attr_reader :name, :messages

    def initialize(name, messages)
      @name = name
      @messages = messages
    end

    def print_conversation
      puts Rainbow(name).underline
      messages.each {|message| puts message_for_display(message) }
    end

    def self.print_all_conversation_metadata
      conversation_metadata = Conversation.all_conversation_metadata
      conversation_metadata.map do |data|
        name = Rainbow(data[:name]).underline
        message_count = Rainbow(data[:message_count]).blue
        last_role = Rainbow(data[:last_role]).color(ROLE_TO_COLOR_MAP[data[:last_role]])
        updated_at = data[:last_updated].strftime('%Y-%m-%d %H:%M:%S')

        puts "#{name} (#{message_count} messages, last from #{last_role}, updated at #{updated_at})"
      end
    end

    private

    def message_for_display(message)
      role = Rainbow(message['role']).color(ROLE_TO_COLOR_MAP[message['role']])
      "#{role}: #{message['content']}"
    end
  end
end
