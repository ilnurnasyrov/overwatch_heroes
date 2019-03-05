module Api
  module V1
    class HeroesController < BaseController
      def index
        paginated_collection = AppContainer[:get_hero_list].call(page: 1, per: 50)

        render json: paginated_collection
      end
    end
  end
end
