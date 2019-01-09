# frozen_string_literal: true

module Api
  module V1
    class Parking::VehiclesController < ApplicationController
      def index
        @vehicles = params[:processed].present? ? Vehicle.previous_parked : Vehicle.current_park_time
        render json: @vehicles, status: :ok
      end
    end
  end
end
