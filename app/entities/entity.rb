require "dry/struct"
require "dry/types"

class Entity < Dry::Struct
  Types = Dry::Types.module

  input input.strict

  def changed(**options)
    self.class.new(**to_h, **options)
  end
end
