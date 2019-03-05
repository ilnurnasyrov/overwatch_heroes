def it_behaves_like_ability_repo(ability_repo)
  it "behaves_like_ability_repo" do
    updated_first_ability = first_ability.changed(shield: 200)

    ability_repo.replace_all_by([first_ability, second_ability])

    expect(
      ability_repo.find_by_id(1)
    ).to eq(first_ability)

    ability_repo.replace_all_by([second_ability, updated_first_ability])

    expect(
      ability_repo.find_by_id(1)
    ).to eq(updated_first_ability)

    expect(
      ability_repo.paginate(page: 1, per: 1)
    ).to eq Paginated.new(
      collection: [updated_first_ability],
      page: 1,
      per: 1,
      total: 2
    )

    expect(
      ability_repo.paginate(page: 1, per: 2)
    ).to eq Paginated.new(
      collection: [updated_first_ability, second_ability],
      page: 1,
      per: 2,
      total: 2
    )

    expect(
      ability_repo.paginate(page: 2, per: 1)
    ).to eq Paginated.new(
      collection: [second_ability],
      page: 2,
      per: 1,
      total: 2
    )
  end
end
