require "utils/app_struct"

class Ability < AppStruct
  attribute :id, Types::Strict::Integer
  attribute :name, Types::Strict::String
  attribute :description, Types::Strict::String
  attribute :is_ultimate, Types::Strict::Bool

  attribute :hero_id, Types::Strict::Integer
end
