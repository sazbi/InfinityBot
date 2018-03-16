require "discordrb"

bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']

bot.run
