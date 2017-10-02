class DosesController < ApplicationController
  before_action :set_cocktail, except: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @ingredients = Ingredient.all
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to (cocktail_path(@dose.cocktail)), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to (cocktail_path(@dose.cocktail))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:ingredient_id, :description)
    end
end
