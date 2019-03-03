require "entities/hero"

class SynchronizeData
  attr_reader :hero_repo, :hero_source, :ability_repo, :ability_source, :version_repo

  def initialize(hero_repo:, hero_source:, ability_repo:, ability_source:, version_repo:)
    @hero_repo = hero_repo
    @hero_source = hero_source

    @ability_repo = ability_repo
    @ability_source = ability_source

    @version_repo = version_repo
  end

  def call
    heroes = hero_source.each.to_a
    abilities = ability_source.each.to_a

    version = version_repo.next_version

    hero_repo.add_batch(
      version: version,
      heroes: heroes
    )

    ability_repo.add_batch(
      version: version,
      abilities: abilities
    )

    version_repo.set_version(version)
  end
end
