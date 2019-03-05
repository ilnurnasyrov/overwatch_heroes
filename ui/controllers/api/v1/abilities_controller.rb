module Api
  module V1
    class AbilitiesController < BaseController
      def index
        result = AppContainer[:get_ability_list].call(params)

        if result.failure?
          return render_errors(result.failure)
        end

        paginated = result.value!

        links = {}
        links[:self] = api_v1_abilities_path(page: paginated.page)
        links[:next] = paginated.next_page && api_v1_abilities_path(page: paginated.next_page)
        links[:prev] = paginated.prev_page && api_v1_abilities_path(page: paginated.prev_page)

        serializer = ::V1::AbilitySerializer.new(
          paginated.collection,
          meta: { total: paginated.total },
          links: links
        )

        render json: serializer.serializable_hash
      end

      def show
        result = AppContainer[:get_ability_details].call(id: params[:id])

        result
          .fmap { |ability| render json: ::V1::AbilitySerializer.new(ability).serializable_hash }
          .or { |failure| render_errors(failure) }
      end
    end
  end
end
