# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})    
    register_success && return if resource.persisted?
    register_failed
  end

  def register_success
    render json: { message: resource }
  end

  def register_failed
    render json: { 
      success: false,
      message: resource.errors 
    }
  end
end
