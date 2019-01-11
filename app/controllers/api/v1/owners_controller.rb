# frozen_string_literal: true

module Api
  module V1
    # Owner
    # - name (string)
    # - document_type (integer: enum)
    # - document (integer)
    class OwnersController < ApplicationController
      before_action :assign_page, only: :index
      def index
        @owners = Owner.all
                       .order(created_at: :desc)
                       .paginate(page: @page, per_page: 15)
        render json: { owners: @owners, current_page: @page }, status: :ok
      end

      def create
        @owner = Owner.find_or_initialize_by(owner_params)
        if @owner.persisted?
          message = { error: 'Owner is already created' }
        else
          @owner.save!
          message = @owner
        end
        render json: message, status: :ok
      rescue StandardError => e
        render json: { errors: e.message }, status: :unprocessable_entity
      end

      private

      def owner_params
        params.require(:owner).permit(:name, :document_type, :document)
      end
    end
  end
end
