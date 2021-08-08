class ApplicationController < ActionController::API
  attr_reader :current_user

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call
    puts "logging the user #{@current_user.nil?}"
    render json: { message: 'Not Authorized' }, status: 401 unless @current_user
  end

  def authorize_admin
    @admin = AuthorizeAdmin.new(current_user).call
    render json: { message: 'You are not Authorized to perform that action' }, status: 401 unless @admin
  end
end
