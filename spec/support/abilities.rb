def first_ability
  Ability.new(
    id: 1,
    name: "Biotic Rifle",
    description: "Ana’s rifle shoots darts that can restore health to her allies or deal ongoing damage to her enemies. She can use the rifle’s scope to zoom in on targets and make highly accurate shots.",
    is_ultimate: false,
    url: "https://overwatch-api.net/api/v1/ability/1",
    hero: {
      id: 1,
      name: "Ana",
      health: 200,
      armour: 0,
      shield: 0,
      real_name: "Ana Amari",
    }
  )
end

def second_ability
  Ability.new(
    id: 2,
    name: "Sleep Dart",
    description: "Ana fires a dart from her sidearm, rendering an enemy unconscious (though any damage will rouse them).",
    is_ultimate: false,
    hero: {
      id: 1,
      name: "Ana",
      health: 200,
      armour: 0,
      shield: 0,
      real_name: "Ana Amari",
    }
  )
end
