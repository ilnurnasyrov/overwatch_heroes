class ARAbilityRepo
  def replace_all_by(heroes)
    ar_heroes = heroes.map do |hero|
      AR::Ability.new(hero.to_h)
    end

    AR::Ability.transaction(joinable: false, requires_new: true) do
      AR::Ability.delete_all
      AR::Ability.import ar_heroes, validate: false
    end
  end

  def find_by_id(id)
    ar_hero = AR::Ability.find_by(id: id)

    Ability.new(ar_hero.attributes.symbolize_keys)
  end

  def paginate(page: 1, per: 50)
    left = (page - 1) * per

    heroes = AR::Ability.order(:id).offset(left).limit(per).map do |ar_hero|
      Ability.new(ar_hero.attributes.symbolize_keys)
    end

    {
      data: heroes,
      total: AR::Ability.count,
      page: page,
      per: per,
    }
  end
end
