# frozen_string_literal: true

module Api
  module V1
    class Parking::VehiclesController < ApplicationController
      before_action :assign_page
      def index
        @vehicles = params[:all_vehicles].present? ? Vehicle.previous_parked : ParkTime.current_vehicles_parked
        @vehicles.order(created_at: :desc)
                 .paginate(page: @page, per_page: 15)
                 .group_by(&:vehicle)
        render json: { vehicles: @vehicles, current_page: @page }, status: :ok
      end
    end
  end
end
