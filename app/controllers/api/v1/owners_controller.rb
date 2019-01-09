# frozen_string_literal: true

module Api
  module V1
    class OwnersController < ApplicationController
      def create
        @owner = Owner.find_or_initialize_by(owner_params)
        if @owner.persisted?
          render json: { error: 'Owner is already created'}, status: :unprocessable_entity
        else
          @owner.save
          render json: @owner, status: :ok
        end
      rescue Exception => e
        render json: { errors: e.message }, status: :unprocessable_entity
      end

      private
      
      def owner_params
        params.require(:owner).permit(:name, :document_type, :document)
      end
    end
  end
end
