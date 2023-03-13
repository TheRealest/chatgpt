# frozen_string_literal: true

require 'openai'

# Handles the API calls to the ChatGPT API

module ChatGPT
  class API
    MODEL_NAME = 'gpt-3.5-turbo'
    TEMPERATURE = 0.7

    class << self
      def send_messages(messages)
        client.chat(
          parameters: {
            model: MODEL_NAME,
            temperature: TEMPERATURE,
            messages: messages
          }
        ).parsed_response
      end

      private

      def client
        @client ||= OpenAI::Client.new(access_token: ENV['CHATGPT_API_KEY'])
      end
    end
  end
end

=begin
[29] pry(main)> response = test_api convo.messages
=> {"id"=>"chatcmpl-6tKYRTGelsnAt6mzh7TVoFOzcEyUz",
 "object"=>"chat.completion",
 "created"=>1678645071,
 "model"=>"gpt-3.5-turbo-0301",
 "usage"=>{"prompt_tokens"=>21, "completion_tokens"=>11, "total_tokens"=>32},
 "choices"=>
  [{"message"=>{"role"=>"assistant", "content"=>"Hello! How may I assist you today?"},
    "finish_reason"=>"stop",
    "index"=>0}]}

=end
