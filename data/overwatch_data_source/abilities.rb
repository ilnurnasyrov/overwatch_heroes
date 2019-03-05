class OverwatchDataSource
  class Abilities
    FIRST_PAGE_URL = "https://overwatch-api.net/api/v1/ability"

    attr_reader :url

    def initialize(url: FIRST_PAGE_URL)
      @url = url
    end

    def to_a
      payload.fetch(:data).map do |ability_attrs|
        Ability.new(
          **ability_attrs,
          hero_id: ability_attrs.fetch(:hero).fetch(:id)
        )
      end
    end

    def next
      return if payload[:next].nil?

      Abilities.new(url: payload[:next])
    end

    def payload
      return @payload if @payload

      body = HTTParty.get(url).body

      @payload = JSON.parse(body, symbolize_names: true)
    end
  end
end
