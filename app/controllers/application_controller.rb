# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def assign_page
    @page = params[:page] || 1
  end
end
