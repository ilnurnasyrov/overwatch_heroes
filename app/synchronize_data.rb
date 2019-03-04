require "entities/hero"

class SynchronizeData
  attr_reader :hero_repo, :ability_repo, :data_source

  def initialize(hero_repo:, ability_repo:, data_source:)
    @hero_repo = hero_repo
    @ability_repo = ability_repo
    @data_source = data_source
  end

  def call
    heroes = data_source.heroes.to_a
    hero_repo.replace_all_by(heroes)

    abilities = data_source.abilities.to_a
    ability_repo.replace_all_by(abilities)
  end
end
