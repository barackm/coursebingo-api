class SessionsController < ApplicationController
  def create
    user = User
      .find_by(email: session_params[:email])
      .try(:authenticate, session_params[:password])

    if user
      user_token = JsonWebToken.encode({ first_name: user.first_name, last_name: user.last_name, email: user.email,
                                         id: user.id, avatar: user.avatar, is_admin: user.is_admin })
      render json: { data: user_token }, status: :ok
    else
      render json: 'Invalid email or password', status: :not_found
    end
  end

  private

  def session_params
    params.require(:session).permit(:password, :email)
  end
end
