require "httparty"
require_relative "overwatch_data_source/abilities"
require_relative "overwatch_data_source/heroes"

class OverwatchDataSource
  def heroes
    make_enumerable(Heroes.new)
  end

  def abilities
    make_enumerable(Abilities.new)
  end

  private

  def make_enumerable(page)
    Enumerator.new do |y|
      collection = page.to_a

      loop do
        item = collection.pop

        if item
          y << item
        elsif page.next
          page = page.next
          collection = page.to_a
        else
          break
        end
      end
    end
  end
end
