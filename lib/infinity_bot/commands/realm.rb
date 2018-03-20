module InfinityBot
  module Commands
    module Realm
      extend Discordrb::Commands::CommandContainer
      command(:realm, description: 'Realm Status') do |event, *arg|
        t = InfinityBot::ApiTools::Realm.realm_status(arg)
        res = "Realm Info: \n ```TYPE: #{t['realms'][0]['type'].upcase} \nPOPULATION: #{t['realms'][0]['population']}\nBATTLEGROUP: #{t['realms'][0]['battlegroup']}\nCONNECTED TO: #{t['realms'][0]['connected_realms'].join(" ").gsub(/\w+/, &:capitalize)}\nTIMEZONE: #{t['realms'][0]['timezone']}```"
      end
    end
  end
end
