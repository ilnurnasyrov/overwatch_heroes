require "utils/app_struct"
require_relative "ability"

class Hero < AppStruct
  attribute :id, Types::Strict::Integer
  attribute :armour, Types::Strict::Integer
  attribute :health, Types::Strict::Integer
  attribute :name, Types::Strict::String
  attribute :real_name, Types::Strict::String
  attribute :shield, Types::Strict::Integer

  attribute :abilities, Types::Array.of(Ability).optional.default([])
end
