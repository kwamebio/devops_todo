class ApplicationController < ActionController::API
  def health_check
    render json: { message: 'API is running' }
  end
end
