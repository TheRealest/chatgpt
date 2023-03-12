require 'thor'
require_relative 'chat'
require_relative 'convo'

module ChatGPT
  module CLI
    class CLI < Thor
      desc 'chat', 'Interact with the ChatGPT API'
      subcommand 'chat', Chat

      desc 'convo', 'Manage conversation data'
      subcommand 'convo', Convo
    end
  end
end
