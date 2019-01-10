# frozen_string_literal: true

module Api
  module V1
    # Check-in and check-out vehicle parking process.
    class ParkingController < ApplicationController
      def create
        # Avoid callbacks usage because can chain overlocks.
        # Use instance methods, are easily to handle when an exception is raised.
        # Or also implement a simple instance variable.
        @vehicle = Vehicle.find_by(identifier: params[:vehicle_identifier])
        if @vehicle.present?
          park_time = @vehicle.park_times.find_or_create_by(processed: false)
          message = park_time
        else
          message = { error: 'Please, register this vehicle before' }
        end
        render json: message, code: 200
      end

      def update
        @vehicle = Vehicle.find_by(identifier: params[:vehicle_identifier])
        if @vehicle.present?
          park_time = @vehicle.park_times.find_or_create_by(processed: false)
          park_time.assign_attributes(
            cost_per_min: params[:cost_per_min],
            processed: params[:processed]
          )
          park_time.save
          message = park_time
        else
          message = { error: 'Please, register this vehicle before' }
        end
        render json: message, code: 200
      end
    end
  end
end
