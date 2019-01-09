# frozen_string_literal: true

module Api
  module V1
    class ParkingController < ApplicationController
      def create
        set_vehicle
        if @vehicle.present?
          park_time = @vehicle.park_times.find_or_create_by(processed: false)
          park_time.cost_per_min = params[:cost_per_min]
          park_time.processed = params[:processed]
          park_time.save unless park_time.persisted?
          render json: park_time, code: 200
        else
          render json: { error: 'Please, register this vehicle before' }, code: 422
        end
      end

      private

      # Avoid callbacks usage because can chain overlocks.
      # Use instance methods, are easily to handle when an exception is raised.
      def set_vehicle
        @vehicle = Vehicle.find_by(identifier: params[:vehicle_identifier])
      end
    end
  end
end
