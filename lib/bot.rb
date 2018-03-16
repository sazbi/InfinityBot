require "discordrb"
require 'dotenv/load'

module InfinityBot
  bot = Discordrb::Commands::CommandBot.new(token: ENV['BOT_TOKEN'],
                                            client_id: ENV['BOT_ID'],
                                            prefix: '!')

  bot.command :ping do |event|
    event.respond "Pong @ #{DateTime.now}"
  end

  bot.run
end
