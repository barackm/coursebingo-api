class CoursesController < ApplicationController
    def index 
        render json: Course.all
    end

    def show
        course ||= Course.find_by(id: params[:id])
        if course.nil?
            render json: {error: "Course not found with ID #{params[:id]}"}, status: 404
        else
            render json: course
        end
    end

    def create 
        course = Course.new(course_params)
        if course.save
            render json: course
        else
            render json: {error: course.errors.full_messages}, status: 422
        end
    end

    private
    def course_params 
      params.require(:course).permit(:name, :description, :duration, :price, :image, :author_id)
    end
end
