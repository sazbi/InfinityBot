module InfinityBot
  module Commands
    module Character
      extend Discordrb::Commands::CommandContainer
      command(
        :character,
        description: 'returns information on character on realm',
        min_args: 2,
        usage: 'character <name> <realm>') do |event, character_name, *realm|
          res = InfinityBot::ApiTools::Character.get(character_name, realm)
          if res.nil?
            char = "`ERROR: Check the spelling of the name and realm`"
          else
            char = "***CHARACTER INFO***\n```Character Name: #{res['name']}\nGuild: #{res['guild']['name']}\nLevel: #{res['level']}\nClass: #{InfinityBot::ApiTools::Character.class_name(res['class'])}\nRace: #{InfinityBot::ApiTools::Character.find_race(res['race'])}```"
          end
        end
    end
  end
end
