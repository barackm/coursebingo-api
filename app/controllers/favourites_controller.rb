class FavouritesController < ApplicationController
  def index
    user ||= User.find_by(id: params[:user_id])
    if user.nil?
      render json: { error: "User not found with ID #{params[:user_id]}" }, status: 404
    else
      favourites = user.favorite_courses
      render json: favourites, status: 200
    end
  end

  def create
    user ||= User.find_by(id: params[:user_id])
    if user.nil?
      render json: { error: "User not found with ID #{params[:user_id]}" }, status: 404
    else
      favourite = Favourite.find_by(user_id: user.id, course_id: favourite_params[:course_id])
      if favourite.nil?
        favourites = user.favourites.build(favourite_params)
        course = Course.find_by(id: favourite_params[:course_id])
        if course.nil?
          render json: { error: "Course not found with ID #{favourite_params[:course_id]}" },
                 status: 404
        elsif favourites.save
          render json: favourites.course, status: 200
        else
          render json: { error: favourites.errors }, status: 500
        end
      else
        render json: { error: 'Favourite already exists' }, status: 500
      end
    end
  end

  def destroy
    favourite ||= Favourite.find_by(id: params[:id])
    if favourite.nil?
      render json: { error: "Favourite not found with ID #{params[:id]}" }, status: 404
    else
      favourite.destroy
      render json: favourite.course, status: 200
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:course_id)
  end
end
