class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    user ||= User.find_by(id: params[:id])
    if user.nil?
      render json: { message: "User not found with ID #{params[:id]}" }, status: 404
    else
      render json: { data: user, message: 'User found successfully' }, status: 200
    end
  end

  def create
    user ||= User.find_by(email: params[:user][:email])
    if user.nil?
      if params[:password] == params[:password_confirmation]
        user = User.new(user_params)
        user.email.downcase!
        user_token = JsonWebToken.encode({ first_name: user.first_name, last_name: user.last_name, email: user.email,
                                           id: user.id, avatar: user.avatar, is_admin: user.is_admin })
        if user.save
          render json: { data: user_token, message: 'User created successfully' }, status: 201
        else
          render json: { message: user.errors.full_messages[0] }, status: 422
        end
      else
        render json: { message: 'Passwords do not match' }, status: 402
      end
    else
      render json: { message: "User already exists with email #{params[:user][:email]}" }, status: 422
    end
  end

  def update
    user ||= User.find_by(id: params[:id])
    if user.nil?
      render json: { error: "User not found with ID #{params[:id]}" }, status: 404
    elsif user.update(user_params)
      render json: { data: user, message: 'User updated successfully' }, status: 200
    else
      render json: { message: user.errors.full_messages[0] }, status: 422
    end
  end

  def destroy
    user ||= User.find_by(id: params[:id])
    if user.nil?
      render json: { error: "User not found with ID #{params[:id]}" }, status: 404
    else
      user.destroy
      render json: { data: user, message: 'User deleted successfully' }, status: 204
    end
  end

  # private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation)
  end
end
