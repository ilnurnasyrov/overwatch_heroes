class GetAbilityDetails
  include Import[:ability_repo]

  def call(id:)
    ability_repo.find_by_id(id)
  end
end
