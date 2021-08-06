class CoursesController < ApplicationController
  before_action :authorize_request, only: %i[create update destroy]
  before_action :check_course_data, only: %i[create update]

  def index
    render json: { data: Course.all, message: 'Courses found successfully' }, status: :ok
  end

  def show
    course ||= Course.find_by(id: params[:id])
    if course.nil?
      render json: { message: "Course not found with ID #{params[:id]}" }, status: 404
    else
      render json: { data: course, message: 'Course found successfully' }, status: :ok
    end
  end

  def create
    user = course ||= User.find_by(id: course_params[:author_id])
    if user.nil?
      render json: { message: "User not found with ID #{course_params[:author_id]}" }, status: 404
    else
      course = user.courses.build(course_params)
      if course.save
        render json: { data: course, message: 'Course created successfully' }, status: 200
      else
        render json: { message: course.errors.full_messages[0] }, status: 400
      end
    end
  end

  def update
    course = Course.find_by(id: params[:id])
    if course.nil?
      render json: { message: "Course not found with ID #{params[:id]}" }, status: 404
    else
      user ||= User.find_by(id: course_params[:author_id])
      if user.nil?
        render json: { message: "User not found with ID #{course_params[:author_id]}" }, status: 404
      elsif course.update(course_params)
        render json: { data: course, message: 'Course updated successfully' }, status: 200
      else
        render json: { message: course.errors.full_messages[0] }, status: 400
      end
    end
  end

  def destroy
    course = Course.find_by(id: params[:id])
    if course.nil?
      render json: { message: "Course not found with ID #{params[:id]}" }, status: 404
    elsif course.destroy
      render json: { message: 'Course deleted successfully', data: course }, status: 200
    else
      render json: { message: 'Course could not be deleted' }, status: 400
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :duration, :price, :image, :author_id)
  end

  def check_course_data
    render json: { message: 'No course data provided' }, status: 422 if params[:name].nil?
  end
end
