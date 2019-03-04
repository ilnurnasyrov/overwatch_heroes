require_relative "entity"

class Hero < Entity
  attribute :id, Types::Strict::Integer
  attribute :armour, Types::Strict::Integer
  attribute :health, Types::Strict::Integer
  attribute :name, Types::Strict::String
  attribute :real_name, Types::Strict::String
  attribute :shield, Types::Strict::Integer

  # Hack that allows to use Hero inside of Ability
  require_relative "ability"
  attribute :abilities, Types::Array.of(Ability).optional.default([])
end
