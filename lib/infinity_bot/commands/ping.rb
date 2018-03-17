module InfinityBot
  module Commands
    module Ping
      extend Discordrb::Commands::CommandContainer
      command(:ping, description: 'Responds with response time.') do |event|
        "Pong! Sent: #{((Time.now - event.timestamp) * 1000).to_i}ms. ago"
      end
    end
  end
end
