class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:criteria]
      @flats = Flat.where("name LIKE ?", "%#{params[:criteria]}%")
    else
      @flats = Flat.all
    end
  end

  def show
  end

  def new
    @flat = Flat.new
    @btn_text = "Create the flat"
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
    @btn_text = "Update the flat"
  end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :picture, :price_per_night, :number_of_guests)
  end
end
