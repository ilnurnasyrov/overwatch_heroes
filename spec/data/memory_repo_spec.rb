require "memory_repo"

RSpec.describe MemoryRepo do
  it_behaves_like_hero_repo(MemoryRepo.new)
end
