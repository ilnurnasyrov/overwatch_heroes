class GetHeroDetails
  attr_reader :hero_repo

  def initialize(hero_repo:)
    @hero_repo = hero_repo
  end

  def call(id:)
    hero_repo.find_by_id(id)
  end
end
