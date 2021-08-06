class CoursesController < ApplicationController
    def index 
        render json: Course.all
    end
end
