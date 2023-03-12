require 'thor'
require_relative '../conversation'
require_relative '../conversation_presenter'

module ChatGPT
  module CLI
    class Convo < Thor
      desc 'list', 'List all conversation names'
      def list
        ConversationPresenter.print_all_conversation_metadata
      end

      desc 'show NAME', 'Print message data for a specific conversation'
      def show(name)
        messages = Conversation.new(name).messages
        ConversationPresenter.new(name, messages).print_conversation
      end
    end
  end
end
