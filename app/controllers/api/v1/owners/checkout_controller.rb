# frozen_string_literal: true

module Api
  module V1
    class Owners::CheckoutController < ApplicationController
      def index
        owner = Owner.find_by(document: params[:owner_document])
        render json: owner.current_park_time, each_serializer: ParkTimeSerializer, status: 200
      end
    end
  end
end
