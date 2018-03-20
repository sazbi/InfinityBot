module InfinityBot
  module Commands
    Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |file| require file }

    @commands = [
      Ping,
      Lmgtfy,
      Delete,
      Character,
      Guild,
      Realm,
      Ban,
      Kick,

    ]

    def self.include!
      @commands.each do |command|
        InfinityBot::BOT.include!(command)
      end
    end
  end
end
