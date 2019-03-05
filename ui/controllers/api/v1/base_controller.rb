module Api
  module V1
    class BaseController < ::ApplicationController
      def params
        request.parameters.symbolize_keys
      end

      def render_errors(error_result)
        status =
          case error_result.first
          when :validation
            422
          when :not_found
            404
          else
            400
          end

        render json: { errors: error_result.last }, status: status
      end
    end
  end
end
