require "synchronize_data"
require "memory_repo"

RSpec.describe SynchronizeData, type: :unit do
  let(:hero_repo) { MemoryRepo.new }
  let(:ability_repo) { MemoryRepo.new }
  let(:data_source) { FakeOverwatchDataSource.new }

  let(:synchronize_heroes) do
    SynchronizeData.new(
      data_source: data_source,
      hero_repo: hero_repo,
      ability_repo: ability_repo,
    )
  end

  it "saves heroes from source to repo" do
    expect(hero_repo.paginate(page: 1, per: 1)).to eq(
      data: [],
      page: 1,
      total: 0,
      per: 1,
    )

    synchronize_heroes.call

    heroes = data_source.heroes.to_a

    expect(hero_repo.paginate(page: 1, per: 1)).to eq(
      data: heroes,
      page: 1,
      total: 1,
      per: 1,
    )
  end

  it "saves abilities from source to repo" do
  end
end
