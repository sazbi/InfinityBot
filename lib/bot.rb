require "discordrb"
require 'dotenv/load'
require 'httparty'



module Kernel
  def suppress(&block)
    original_verbosity = $VERBOSE
    $VERBOSE = nil
    yield block
    $VERBOSE = original_verbosity
  end
end

module InfinityBot
  suppress { Discordrb::LOG_TIMESTAMP_FORMAT = '%Y-%m-%d %H:%M:%S' }

  debug = ARGV.include?('-debug') ? :debug : false
  log_streams = [STDOUT]

  if debug
    timestamp = Time.now.strftime(Discordrb::LOG_TIMESTAMP_FORMAT).tr(':', '-')
    log_file = File.new("#{Dir.pwd}/logs/#{timestamp}.log", 'a+')
    log_streams.push(log_file)
  end

  suppress { LOGGER = Discordrb::LOGGER = Discordrb::Logger.new(nil, log_streams) }

  LOGGER.debug = true if debug

  Dir["#{File.dirname(__FILE__)}/infinity_bot/*.rb"].each { |file| require file }

  BOT = Discordrb::Commands::CommandBot.new(token: ENV['BOT_TOKEN'],
                                            client_id: ENV['BOT_ID'],
                                            prefix: '!')
  Commands.include!
  ApiTools.include!


  LOGGER.info "Welcome to the Infinity Bot, Designed and Created by Andrew Pierson (Sazbi)"
  LOGGER.info 'Use ctrl+c to safely stop the bot.'
  LOGGER.info 'If bot crashes, reload using -debug argument'

  at_exit do
    LOGGER.info 'Shutting Down'
    exit!
  end




  BOT.run
end
