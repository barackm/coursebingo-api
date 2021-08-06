class CoursesController < ApplicationController
  def index
    render json: Course.all
  end

  def show
    course ||= Course.find_by(id: params[:id])
    if course.nil?
      render json: { error: "Course not found with ID #{params[:id]}" }, status: 404
    else
      render json: course
    end
  end

  def create
    user = course ||= User.find_by(id: course_params[:author_id])
    if user.nil?
      render json: { error: "User not found with ID #{course_params[:author_id]}" }, status: 404
    else
      course = user.courses.build(course_params)
      if course.save
        render json: course, status: 200
      else
        render json: { error: 'Course could not be created' }, status: 400
      end
    end
  end

  def update
    course = Course.find_by(id: params[:id])
    if course.nil?
      render json: { error: "Course not found with ID #{params[:id]}" }, status: 404
    else
      user ||= User.find_by(id: course_params[:author_id])
      if user.nil?
        render json: { error: "User not found with ID #{course_params[:author_id]}" }, status: 404
      elsif course.update(course_params)
        render json: course, status: 200
      else
        render json: { error: 'Course could not be updated' }, status: 400
      end
    end
  end

  def destroy
    course = Course.find_by(id: params[:id])
    if course.nil?
      render json: { error: "Course not found with ID #{params[:id]}" }, status: 404
    elsif course.destroy
      render json: { success: 'Course deleted' }, status: 200
    else
      render json: { error: 'Course could not be deleted' }, status: 400
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :duration, :price, :image, :author_id)
  end
end
