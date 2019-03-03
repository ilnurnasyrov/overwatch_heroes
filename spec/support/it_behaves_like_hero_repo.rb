def it_behaves_like_hero_repo(hero_repo)
  it "behaves_like_hero_repo" do
    first_hero = Hero.new(
      id: 1,
      name: "Ana",
      health: 200,
      armour: 0,
      shield: 0,
      real_name: "Ana Amari",
    )

    updated_first_hero = first_hero.changed(shield: 200)

    second_hero = Hero.new(
      id: 2,
      name: "Bastion",
      health: 200,
      armour: 100,
      shield: 0,
      real_name: "SST Laboratories Siege Automaton E54",
    )

    hero_repo.add_or_update_by_id(first_hero)
    hero_repo.add_or_update_by_id(second_hero)

    expect(
      hero_repo.get_by_id(1)
    ).to eq(first_hero)

    hero_repo.add_or_update_by_id(updated_first_hero)

    expect(
      hero_repo.get_by_id(1)
    ).to eq(updated_first_hero)

    expect(
      hero_repo.get_all_by(page: 1, per: 1)
    ).to eq(
      data: [updated_first_hero],
      page: 1,
      last_page: 2,
      total: 2
    )

    expect(
      hero_repo.get_all_by(page: 1, per: 2)
    ).to eq(
      data: [updated_first_hero, second_hero],
      page: 1,
      last_page: 1,
      total: 2
    )

    expect(
      hero_repo.get_all_by(page: 2, per: 1)
    ).to eq(
      data: [second_hero],
      page: 2,
      last_page: 2,
      total: 2
    )
  end
end
