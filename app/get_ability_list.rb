class GetAbilityList
  attr_reader :ability_repo

  def initialize(ability_repo:)
    @ability_repo = ability_repo
  end

  def call(page:, per:)
    ability_repo.paginate(page: page, per: per)
  end
end
