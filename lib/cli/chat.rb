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

      desc 'models', 'List available models, filtered to GPT only by default'
      method_option :all, type: :boolean, aliases: '-a', desc: 'List all models, not just GPT'
      def models
        puts "Listing #{'all ' if options[:all]}models..."
        models = API.list_models
        models.select! {|model| model.include?('gpt') } unless options[:all]
        puts models
      end
    end
  end
end
