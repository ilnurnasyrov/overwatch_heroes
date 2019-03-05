require "memory_repo"

RSpec.describe MemoryRepo do
  it_behaves_like_hero_repo(MemoryRepo.new)
  it_behaves_like_ability_repo(MemoryRepo.new)
end
