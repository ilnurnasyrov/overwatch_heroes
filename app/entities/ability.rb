require_relative "entity"
require_relative "hero"

class Ability < Entity
  attribute :id, Types::Strict::Integer
  attribute :name, Types::Strict::String
  attribute :description, Types::Strict::String
  attribute :is_ultimate, Types::Strict::Bool
  attribute :version, Types::Integer.optional.default(nil)

  attribute :hero, Hero.optional.default(nil)
end
