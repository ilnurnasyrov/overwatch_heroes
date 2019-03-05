require "utils/app_struct"

class Paginated < AppStruct
  attribute :per, Types::Strict::Integer
  attribute :page, Types::Strict::Integer
  attribute :total, Types::Strict::Integer
  attribute :collection, Types::Strict::Array.of(Types::Any)
end
