class TeachersController < ApplicationController

    def index 
        teacher = Teacher.all
        render json: teachers
    end

    def create
        teacher = Teacher.create!(teacher_params)
        render json: teacher, status: :created
    end

    def destroy
        teacher = find_teacher
        teacher.destroy
    end

    private

    def teacher_params
        params.permit(:name, :house_id)
    end
    
    def render_not_found_response
        render json: {error: "Teacher not found"}, status: :not_found
    end

    def find_teacher
        Teacher.find(params[:id])
    end
end