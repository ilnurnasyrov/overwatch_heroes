require "get_hero_list"
require "memory_repo"

RSpec.describe GetHeroList do
  let(:hero_repo) { MemoryRepo.new }
  let(:get_hero_list) { GetHeroList.new(hero_repo: hero_repo) }

  before { hero_repo.replace_all_by([first_hero, second_hero]) }

  it "returns paginated collection" do
  end
end
