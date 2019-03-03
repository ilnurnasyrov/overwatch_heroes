RSpec.describe MemoryHeroRepo do
  it_behaves_like_hero_repo(MemoryHeroRepo.new)
end
