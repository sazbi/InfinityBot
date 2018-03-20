module InfinityBot
  module Commands
    module Ban
      extend Discordrb::Commands::CommandContainer
      command(:ban, description: 'Drops the BAN HAMMER on someone',
                       min_args: 1, required_permissions: [:ban_members],
                       usage: 'ban <@user>') do |event, user|
        event.respond "Banning #{user}"
        event.server.ban(event.bot.parse_mention(user))

      end
    end
  end
end
