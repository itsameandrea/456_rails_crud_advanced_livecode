class PlantsController < ApplicationController
  # /gardens/:garden_id/plants/new
  def new
    @plant = Plant.new
    @garden = Garden.find params[:garden_id]
  end

  def create
    @garden = Garden.find params[:garden_id]
    @plant = Plant.new plant_params

    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    @plant = Plant.find params[:id]

    @plant.destroy

    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image)
  end
end
