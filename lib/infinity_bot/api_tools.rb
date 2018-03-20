module InfinityBot
  module ApiTools
    Dir["#{File.dirname(__FILE__)}/api_tools/*.rb"].each { |file| require file }

    @tools = [
      Character,
      Guild,
      Realm,
    ]

    def self.include!
      @tools.each do |tool|
        InfinityBot::BOT.include!(tool)
      end
    end
  end
end
