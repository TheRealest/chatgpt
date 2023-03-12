require 'awesome_print'
require 'thor'
require_relative '../api'

module ChatGPT
  module CLI
    class Chat < Thor
      desc 'send NAME', 'Send a conversation to ChatGPT to get the next message'
      def send(name)
        puts "Sending conversation '#{name}' to ChatGPT..."
        convo = Conversation.new(name)
        response = API.send_messages(convo.messages)

        puts 'Response:'
        ap response.parsed_response
      end
    end
  end
end
