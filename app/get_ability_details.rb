require "dry/monads/do"
require "dry/monads/result"

class GetAbilityDetails
  include Dry::Monads::Result::Mixin
  include Dry::Monads::Do.for(:call)
  include Import[:ability_repo]

  Schema = Dry::Validation.Params do
    required(:id).filled(:int?, gt?: 0)
  end

  def call(params)
    params = yield validate_params(params)

    ability = ability_repo.find_by_id(params[:id])

    if ability
      Success(ability)
    else
      Failure([:not_found, id: ['not found']])
    end
  end

  private

  def validate_params(params)
    Schema.call(params).to_monad.or do |errors|
      Failure([:validation, errors])
    end
  end
end
