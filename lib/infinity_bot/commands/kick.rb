module InfinityBot
  module Commands
    module Kick
      extend Discordrb::Commands::CommandContainer
      command(:kick, description: 'Kicks user from server',
                       min_args: 1, required_permissions: [:kick_members],
                       usage: 'kick <@user>') do |event, user|

        event.server.kick(event.bot.parse_mention(user))
        event.respond "Kicking #{user}"
      end
    end
  end
end
