def first_hero
  Hero.new(
    id: 1,
    name: "Ana",
    health: 200,
    armour: 0,
    shield: 0,
    real_name: "Ana Amari",
  )
end

def second_hero
  Hero.new(
    id: 2,
    name: "Bastion",
    health: 200,
    armour: 100,
    shield: 0,
    real_name: "SST Laboratories Siege Automaton E54",
  )
end
