class FavouritesController < ApplicationController
  before_action :authorize_request
  before_action :check_favourite_data, only: [:create]
  before_action :authorize_admin, only: :index

  def index 
    @favourites = Favourite.all.order('created_at DESC')
    render json: @favourites, status: 200
  end

  def show
    user ||= User.find_by(id: params[:id])
    if user.nil?
      render json: { message: "User not found with ID #{params[:id]}" }, status: 404
    else
      favourites = user.favourites.order('created_at DESC')
      render json: favourites, status: 200
    end
  end

  def create # rubocop:disable Metrics/PerceivedComplexity
    user ||= User.find_by(id: favourite_params[:user_id])
    if user.nil?
      render json: { message: "User not found with ID #{favourite_params[:user_id]}" }, status: 404
    else
      favourite = Favourite.find_by(user_id: user.id, course_id: favourite_params[:course_id])
      if favourite.nil?
        favourites = user.favourites.build(favourite_params)
        course = Course.find_by(id: favourite_params[:course_id])
        if course.nil?
          render json: { message: "Course not found with ID #{favourite_params[:course_id]}" },
                 status: 404
        elsif favourites.save
          render json: favourites, status: 200
        else
          render json: { message: favourites.errors.full_messages[0] }, status: 400
        end
      else
        render json: { message: 'Favourite already exists' }, status: 400
      end
    end
  end

  def destroy
    favourite ||= Favourite.find_by(id: params[:id])
    if favourite.nil?
      render json: { message: "Favourite not found with ID #{params[:id]}" }, status: 404
    else
      favourite.destroy
      render json: favourite, status: 200
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:course_id, :user_id)
  end

  def check_favourite_data
    return unless params[:course_id].nil? || params[:user_id].nil?

    render json: { message: 'No favourite data provided' },
           status: 422
  end
end
