module InfinityBot
  module Commands
    module Delete
      extend Discordrb::Commands::CommandContainer
      command(:delete, description: 'Deletes messages in this channel.',
                       min_args: 1, required_permissions: [:manage_messages],
                       usage: 'delete <ammount>') do |event, ammount|
        if event.bot.profile.on(event.server).permission?(:manage_messages,
                                                          event.channel)
          ammount = ammount.to_i
          next "Can't delete less than 2 messages." if ammount < 2

          while ammount > 100
            event.channel.prune(100)
            ammount -= 100
          end
          event.channel.prune(ammount) if ammount >= 2
          nil
        else
          "You do not have Permission To Do That!"
        end
      end
    end
  end
end
