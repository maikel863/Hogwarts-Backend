class HousesController < ApplicationController
    def index
        @houses = House.all
        render json: houses
    end

    def create
        house = House.create!(house_params)
        render json: house, status: created
    end
    
    def show
        house = find_house
        render json: house, include: :students, :teachers
    end

    private

    def house_params
        params.permit(:name, :points)
    end

    def render_not_found_response
        render json: {error: "House not found"}, status: :not_found
    end

    def find_house
        House.find(params[:id])
    end
    

end