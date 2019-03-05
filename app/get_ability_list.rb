require "utils/use_case"

class GetAbilityList < UseCase
  include Dry::Monads::Do.for(:call)
  include Import[:ability_repo]

  Schema = Dry::Validation.Params do
    optional(:page).maybe(:int?, gt?: 0)
    optional(:per).maybe(:int?, gt?: 0, lteq?: 50)
    optional(:hero_id).maybe(:int?, gt?: 0)
  end

  def call(params)
    params = yield validate_params(params)

    paginated_ability_list(params)
  end

  private

  def validate_params(params)
    Schema.call(params).to_monad.or do |errors|
      Failure([:validation, errors])
    end
  end

  def paginated_ability_list(params)
    paginated = ability_repo.paginate(params)

    Success(paginated)
  end
end
