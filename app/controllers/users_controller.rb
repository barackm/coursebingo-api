class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    if user.nil?
      render json: {error: "User not found with ID #{params[:id]}"}, status: 404
    else
      render json: user
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user.nil?
      user = User.new(user_params)
      if user.save
        render json: user, status: 201
      else
        render json: {error: user.errors}, status: 422
      end
    else 
      render json: {error: "User already exists with email #{params[:user][:email]}"}, status: 422
    end
  end

  def update
    user ||= User.find_by(id: params[:id])
    if user.nil? 
      render json: {error: "User not found with ID #{params[:id]}"}, status: 404
    else
      if user.update(user_params)
        render json: user
      else
        render json: {error: user.errors}, status: 422
      end
    end
  end

  def destroy
    user ||= User.find_by(id: params[:id])
    if user.nil?
      render json: {error: "User not found with ID #{params[:id]}"}, status: 404
    else
      user.destroy
      render json: user, status: 204
    end
  end

  private 

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation)
    end
end
