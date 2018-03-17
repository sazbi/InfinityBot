module InfinityBot
  module Commands
    module Lmgtfy
      extend Discordrb::Commands::CommandContainer
      command(:lmgtfy,
              min_args: 1,
              description: 'converts request to a lmgtfy link',
              usage: 'lmgtfy <text>') do |event, *text|
                "http://lmgtfy.com/?q=#{text.join('+')}"

      end
    end
  end
end
