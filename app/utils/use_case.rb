require "dry/monads/do"
require "dry/monads/result"
require "dry/validation"

class UseCase
  include Dry::Monads::Result::Mixin
end
