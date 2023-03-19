class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def create
    signup = Signup.create!(signup_params)
    render json: signup, status: :created
  end

  private

  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end

  def not_found_message
    render json: { error: 'No such signup' }, status: :not_found
  end

  def render_unprocessable_entity(entity)
    render json: {
             errors: entity.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
