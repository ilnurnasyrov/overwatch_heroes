class GetHeroDetails
  include Import[:hero_repo]

  def call(id:)
    hero_repo.find_by_id(id)
  end
end
