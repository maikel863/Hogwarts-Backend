class StudentsController < ApplicationController

    def index 
        students = Student.all
        render json: students
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def destroy
        student = find_student
        student.destroy
    end

    private

    def student_params
        params.permit(:name, :house_id)
    end
    
    def render_not_found_response
        render json: {error: "Student not found"}, status: :not_found
    end

    def find_student
        Student.find(params[:id])
    end
end