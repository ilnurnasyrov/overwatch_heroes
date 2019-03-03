require "entities/hero"

def it_behaves_like_hero_source(hero_source)
  it "behaves_like_hero_source" do
    # each
    expect(hero_source.each).to be_a Enumerator
    expect(hero_source.each.count).to be > 0

    first_hero = hero_source.each.first

    expect(first_hero).to be_a Hero
  end
end
