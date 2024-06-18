class MissionsController < ApplicationController

  def index
    @missions = @listing.missions
    render json: @missions
  end

  def show
    @mission = Mission.find(params[:id])
    render json: @mission
  end

  def create
  end

  # def update
  #   @mission = Mission.find(params[:id])
  #   if @mission.update(mission_params)
  #     render json: @mission
  #   else
  #     render json: @mission.errors, status: :unprocessable_entity
  #   end
  # end

  def destroy
  end

  private

  def mission_params
    params.require(:mission).permit(:status)
  end
end
