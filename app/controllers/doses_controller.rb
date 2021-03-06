class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  # GET /doses
  def index
    @doses = Dose.all
  end

  # GET /doses/1
  def show
  end

  # GET /doses/new
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /cocktails/:cocktail_id/doses
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1
  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /doses/1
  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
