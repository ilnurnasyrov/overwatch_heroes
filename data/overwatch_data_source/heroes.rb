class OverwatchDataSource
  class Heroes
    FIRST_PAGE_URL = "https://overwatch-api.net/api/v1/hero"

    attr_reader :url

    def initialize(url: FIRST_PAGE_URL)
      @url = url
    end

    def to_a
      payload.fetch(:data).map do |hero_attrs|
        Hero.new(hero_attrs)
      end
    end

    def next
      return if payload[:next].nil?

      Heroes.new(url: payload[:next])
    end

    def payload
      return @payload if @payload

      body = HTTParty.get(url).body

      @payload = JSON.parse(body, symbolize_names: true)
    end
  end
end
