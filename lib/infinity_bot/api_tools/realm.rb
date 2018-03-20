module InfinityBot
  module ApiTools
    module Realm
      extend Discordrb::Commands::CommandContainer

      def self.realm_status realm
        res = HTTParty.get("https://us.api.battle.net/wow/realm/status?locale=en_US&apikey=#{ENV['BLIZZARD_API_KEY']}&realm=#{realm.join("%20")}")
      end

      
    end
  end
end
