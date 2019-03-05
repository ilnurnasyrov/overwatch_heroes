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
    expect(hero_repo.paginate(page: 1).collection).to eq []

    synchronize_heroes.call

    heroes = data_source.heroes.to_a

    expect(hero_repo.paginate(page: 1).collection).to eq heroes
  end

  it "saves abilities from source to repo" do
  end
end
