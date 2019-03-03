require "entities/hero"

class MemoryHeroRepo
  def initialize
    @heroes = {}
  end

  def add_or_update_by_id(hero_attributes)
    hero = get_by_id(hero_attributes[:id])

    hero =
      if hero
        hero.changed(hero_attributes)
      else
        Hero.new(hero_attributes)
      end

    heroes[hero.id] = hero
  end

  def get_by_id(id)
    heroes[id]
  end

  def get_all_by(page: 1, per: 100)
    left = (page - 1) * per
    right = left + per - 1

    data = heroes.values[left..right]

    last_page = (heroes.count / per.to_f).ceil

    {
      page: page,
      last_page: last_page,
      total: heroes.count,
      data: data
    }
  end

  private

  attr_reader :heroes
end
