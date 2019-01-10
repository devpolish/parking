# frozen_string_literal: true

module Api
  module V1
    class Owners::VehiclesController < ApplicationController
      def create
        @owner = Owner.find_by(document: params[:owner_document])
        @vehicle = @owner.vehicles.find_or_initialize_by(vehicle_params)
        if @vehicle.persisted?
          message = { error: 'Vehicle is already created' }
        else
          @vehicle.save
          message = @vehicle
        end
        render json: message, status: :ok
      end

      private

      # Rubocop style guide
      # https://github.com/rubocop-hq/ruby-style-guide
      def vehicle_params
        params.require(:vehicle).permit(:kind, :identifier)
      end
    end
  end
end
