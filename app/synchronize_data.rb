require "entities/hero"

class SynchronizeData
  include Import[:hero_repo, :ability_repo, :data_source]

  def call
    heroes = data_source.heroes.to_a
    abilities = data_source.abilities.to_a

    hero_repo.transaction do
      hero_repo.replace_all_by(heroes)
      ability_repo.replace_all_by(abilities)
    end
  end
end
