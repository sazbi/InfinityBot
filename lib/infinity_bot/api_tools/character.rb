module InfinityBot
  module ApiTools
    module Character
      extend Discordrb::Commands::CommandContainer
      @classes = [
        {id: 1, name: "Warrior", resource: "Rage"},
        {id: 2, name: "Paladin", resource: "Mana"},
        {id: 3, name: "Hunter", resource: "Focus"},
        {id: 4, name: "Rogue", resource: "Energy"},
        {id: 5, name: "Priest", resource: "Mana"},
        {id: 6, name: "Death Knight", resource: "Runic Power"},
        {id: 7, name: "Shaman", resource: "Mana"},
        {id: 8, name: "Mage", resource: "Mana"},
        {id: 9, name: "Warlock", resource: "Mana"},
        {id: 10, name: "Monk", resource: "Energy"},
        {id: 11, name: "Druid", resource: "Energy"},
        {id: 12, name: "Demon Hunter", resource: "Fury"}
      ]
      @races = [
        {id: 1, side: "Alliance", name: "Human"},
        {id: 2, side: "Horde", name: "Orc"},
        {id: 3, side: "Alliance", name: "Dwarf"},
        {id: 4, side: "Alliance", name: "Night Elf"},
        {id: 5, side: "Horde", name: "Undead"},
        {id: 6, side: "Horde", name: "Tauren"},
        {id: 7, side: "Alliance", name: "Gnome"},
        {id: 8, side: "Horde", name: "Troll"},
        {id: 9, side: "Horde", name: "Goblin"},
        {id: 10, side: "Horde", name: "Blood Elf"},
        {id: 11, side: "Alliance", name: "Draenei"},
        {id: 22, side: "Alliance", name: "Worgen"},
        {id: 24, side: "Neutral", name: "Pandaren"},
        {id: 25, side: "Alliance", name: "Pandaren"},
        {id: 26, side: "Horde", name: "Pandaren"},
        {id: 27, side: "Horde", name: "Nightborne"},
        {id: 28, side: "Horde", name: "Highmountain Tauren"},
        {id: 29, side: "Alliance", name: "Void Elf"},
        {id: 30, side: "Alliance", name: "Lightforged Draenei"},
      ]
      def self.get character_name, realm
        uri_base = "https://us.api.battle.net/wow/character/"
        query = realm.gsub(" ", "%20") + "/" + character_name + "?fields=guild&locale=en_US&apikey=#{ENV['BLIZZARD_API_KEY']}"
        HTTParty.get(uri_base + query)
      end

      def self.class_name(id)
        @classes.find { |c| c[:id] == id }[:name]
      end

      def self.find_race(id)
        @races.find { |c| c[:id] == id }[:name]
      end
    end
  end
end
