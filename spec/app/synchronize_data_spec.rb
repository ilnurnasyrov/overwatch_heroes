require "synchronize_data"
require "memory_hero_repo"

RSpec.describe SynchronizeData, type: :unit do
  let(:hero_source) { FakeHeroSource.new }
  let(:hero_repo) { MemoryHeroRepo.new }

  let(:synchronize_heroes) do
    SynchronizeData.new(
      hero_source: hero_source,
      hero_repo: hero_repo,
    )
  end

  it "saves heroes from source to repo" do
    expect(hero_repo.get_all_by(page: 1, per: 1)).to eq(
      data: [],
      page: 1,
      total: 0,
      last_page: 0
    )

    synchronize_heroes.call

    heroes = hero_source.each_hero.to_a

    expect(hero_repo.get_all_by(page: 1, per: 1)).to eq(
      data: heroes,
      page: 1,
      total: 1,
      last_page: 1
    )
  end

  it "saves abilities from source to repo" do
  end
end
