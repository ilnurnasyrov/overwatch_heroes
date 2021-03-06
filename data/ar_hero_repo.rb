require "struct/paginated"

class ARHeroRepo
  def transaction(&block)
    AR::Hero.with_advisory_lock("ar_heroes_update", &block)
  end

  def replace_all_by(heroes)
    ar_heroes = heroes.map do |hero|
      AR::Hero.new(hero.to_h.except(:abilities))
    end

    AR::Hero.transaction(joinable: false, requires_new: true) do
      AR::Hero.delete_all
      AR::Hero.import ar_heroes, validate: false
    end
  end

  def find_by_id(id)
    ar_hero = AR::Hero.find_by(id: id)

    ar_hero && Hero.new(ar_hero.attributes.symbolize_keys)
  end

  def paginate(page: 1, per: 50)
    left = (page - 1) * per

    heroes = AR::Hero.order(:id).offset(left).limit(per).map do |ar_hero|
      Hero.new(ar_hero.attributes.symbolize_keys)
    end

    Paginated.new(
      collection: heroes,
      total: AR::Hero.count,
      page: page,
      per: per,
    )
  end
end
