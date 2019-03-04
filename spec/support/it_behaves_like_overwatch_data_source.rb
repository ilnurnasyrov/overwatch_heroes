require "entities/hero"

def it_behaves_like_overwatch_data_source(hero_source)
  it "behaves_like_overwatch_data_source" do
    # heroes
    expect(hero_source.heroes).to be_a Enumerator
    expect(hero_source.heroes.count).to be > 0

    first_hero = hero_source.heroes.first

    expect(first_hero).to be_a Hero

    # abilities
    expect(hero_source.abilities).to be_a Enumerator
    expect(hero_source.abilities.count).to be > 0

    first_ability = hero_source.abilities.first

    expect(first_ability).to be_an Ability
  end
end
