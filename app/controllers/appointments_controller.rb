class AppointmentsController < ApplicationController


    def index 
        appointment = Appointment.all
        render json: appointments
    end

    def create
        appointment = Appointment.create!(appt_params)
        render json: appointment, status: :created
    end

    def destroy
        appointment = find_appt
        appointment.destroy
    end

    private

    def appt_params
        params.permit(:meeting_time, :teacher_id, :student_id)
    end

    def render_not_found_response
        render json: {error: "Teacher not found"}, status: :not_found
    end

    def find_appt
        Appointment.find(params[:id])
    end

end