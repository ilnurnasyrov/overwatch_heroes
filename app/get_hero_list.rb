class GetHeroList
  include Import[:hero_repo]

  def call(page:, per:)
    hero_repo.paginate(page: page, per: per)
  end
end
