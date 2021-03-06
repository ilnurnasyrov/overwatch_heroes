require "struct/paginated"

class ARAbilityRepo
  def replace_all_by(abilities)
    ar_abilities = abilities.map do |ability|
      AR::Ability.new(ability.to_h)
    end

    AR::Ability.transaction(joinable: false, requires_new: true) do
      AR::Ability.delete_all
      AR::Ability.import ar_abilities, validate: false
    end
  end

  def find_by_id(id)
    ar_ability = AR::Ability.find_by(id: id)

    Ability.new(ar_ability.attributes.symbolize_keys)
  end

  def paginate(page: 1, per: 50, hero_id: nil)
    left = (page - 1) * per

    relation = AR::Ability.order(:id)
    relation = relation.where(hero_id: hero_id) if hero_id

    total = relation.count

    abilities = relation.offset(left).limit(per).map do |ar_ability|
      Ability.new(ar_ability.attributes.symbolize_keys)
    end

    Paginated.new(
      collection: abilities,
      total: total,
      page: page,
      per: per,
    )
  end
end
