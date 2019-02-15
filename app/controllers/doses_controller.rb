class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    dose.cocktail = @cocktail
    dose.save!
    redirect_to cocktail_path(@cocktail)
  end

  def delete
    @dose = Dose.find(params[:id])
  end

  private
  def dose_params
    params.require(:dose).permit(:ingredient_id, :description, :cocktail_id)
  end
end
