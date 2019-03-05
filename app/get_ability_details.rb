class GetAbilityDetails
  attr_reader :ability_repo

  def initialize(ability_repo:)
    @ability_repo = ability_repo
  end

  def call(id:)
    ability_repo.find_by_id(id)
  end
end
