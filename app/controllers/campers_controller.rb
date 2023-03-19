class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    campers = Camper.all
    render json: campers, status: :ok
  end

  def show
    camper = find_camper
    render json: camper, status: :ok
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def find_camper
    Camper.find(params[:id])
  end

  def camper_params
    params.permit(:name, :age)
  end

  def not_found_message
    render json: { error: 'Camper not found' }, status: :not_found
  end

  def render_unprocessable_entity(entity)
    render json: {
             errors: entity.record.errors,
           },
           status: :unprocessable_entity
  end
end
