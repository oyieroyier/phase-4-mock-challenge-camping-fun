class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    activities = Activity.all
    render json: activities, status: :ok
  end

  def destroy
    activity = find_activity
    activity.destroy

    head :no_content
  end

  private

  def find_activity
    Activity.find(params[:id])
  end

  def not_found_message
    render json: { error: 'Activity not found' }, status: :not_found
  end

  def render_unprocessable_entity(entity)
    render json: { errors: entity.record.errors }, status: :unprocessable_entity
  end
end
