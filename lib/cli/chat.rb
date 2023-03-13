require 'awesome_print'
require 'thor'
require_relative '../api'

module ChatGPT
  module CLI
    class Chat < Thor
      desc 'send NAME', 'Send a conversation to ChatGPT to get the next message'
      method_option :debug, type: :boolean, aliases: '-d', desc: 'Print debug information'
      def send(name)
        puts "Sending conversation '#{name}' to ChatGPT..."
        convo = Conversation.new(name, debug: options[:debug])
        convo.get_next_message

        ConversationPresenter.new(name, convo.messages).print_conversation
      end
    end
  end
end
