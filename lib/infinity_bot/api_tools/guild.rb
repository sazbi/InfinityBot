module InfinityBot
  module ApiTools
    module Guild
      extend Discordrb::Commands::CommandContainer

      def self.parse_guild event

      end
      def self.get guild, realm
        uri_base = "https://us.api.battle.net/wow/guild/"
        query = realm.strip!.gsub(' ', '%20') + "/" + guild.gsub(' ', '%20') + "?fields=members&locale=en_US&apikey=#{ENV['BLIZZARD_API_KEY']}"
        HTTParty.get(uri_base + query)
      end
    end
  end
end
