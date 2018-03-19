module InfinityBot
  module Commands
    module Guild
      extend Discordrb::Commands::CommandContainer


      command(
        :guild,
        description: 'returns information on guild on realm',
        min_args: 2,
        usage: 'guild <name>, <realm>') do |event|
          arg = event.message.content.split(' ', 2)
          arg = arg[1].split(',')
          res = InfinityBot::ApiTools::Guild.get(arg[0], arg[1])
          if res['status']
            list = "`ERROR: #{res['reason']}``"
          else
            list = "**Guild Info**```Guild Name: #{res['name']} \nRealm: #{res['realm']} \nBattlegroup: #{res['battlegroup']} \nMember Count: #{res['members'].count}```"
          end
      end
    end
  end
end
