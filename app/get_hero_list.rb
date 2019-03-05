class GetHeroList
  attr_reader :hero_repo

  def initialize(hero_repo:)
    @hero_repo = hero_repo
  end

  def call(page:, per:)
    hero_repo.paginate(page: page, per: per)
  end
end
