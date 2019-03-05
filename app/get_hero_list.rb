require "utils/use_case"

class GetHeroList < UseCase
  include Dry::Monads::Do.for(:call)
  include Import[:hero_repo]

  Schema = Dry::Validation.Params do
    optional(:page).maybe(:int?, gt?: 0)
    optional(:per).maybe(:int?, gt?: 0, lteq?: 50)
  end

  def call(params)
    params = yield validate_params(params)

    paginated_hero_list(params)
  end

  private

  def validate_params(params)
    Schema.call(params).to_monad.or do |errors|
      Failure([:validation, errors])
    end
  end

  def paginated_hero_list(page: 1, per: 50)
    paginated = hero_repo.paginate(page: page, per: per)

    Success(paginated)
  end
end
