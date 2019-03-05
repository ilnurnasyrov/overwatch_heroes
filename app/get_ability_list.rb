class GetAbilityList
  include Import[:ability_repo]

  def call(page:, per:)
    ability_repo.paginate(page: page, per: per)
  end
end
