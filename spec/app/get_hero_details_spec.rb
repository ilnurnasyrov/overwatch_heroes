require "get_hero_details"
require "memory_repo"

RSpec.describe GetHeroDetails do
  let(:hero_repo) { MemoryRepo.new }
  let(:get_hero_details) { GetHeroDetails.new(hero_repo: hero_repo) }

  before { hero_repo.replace_all_by([first_hero, second_hero]) }

  it "returns paginated collection of heroes" do
    expect(
      get_hero_details.call(id: second_hero.id).value!
    ).to eq second_hero
  end
end

