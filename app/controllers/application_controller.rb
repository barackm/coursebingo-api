class ApplicationController < ActionController::API
    attr_reader :current_user
  
    private
  
    def authenticate_request
      @current_user = AuthorizeApiRequest.new(request.headers).call
      render json: { message: 'Not Authorized' }, status: 401 unless @current_user
    end
end
