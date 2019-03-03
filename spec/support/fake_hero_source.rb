require "entities/hero"

class FakeHeroSource
  def each(&block)
    [first_hero].each(&block)
  end
end

RSpec.describe FakeHeroSource do
  it_behaves_like_hero_source(FakeHeroSource.new)
end
