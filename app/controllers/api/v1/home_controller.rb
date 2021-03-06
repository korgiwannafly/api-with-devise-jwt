class Api::V1::HomeController < ActionController::API
  include ActionController::MimeResponds
  before_action :authenticate_user!
  respond_to :json

  def index    
    render json: { message: "If you see this, you're in!" }
  end
end
