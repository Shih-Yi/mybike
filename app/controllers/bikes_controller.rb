class BikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  before_action :set_bike, :only => [ :show, :edit, :update, :destroy]

  def index
    @bikes = Bike.all
    @bikes = Bike.page(params[:page]).per(5)
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      flash[:notice] = "was successfully created"
      redirect_to bikes_path
    else
      render :action => :new
    end
  end

  def show
    @page_title = @bike.name
  end

  def edit

  end

  def update
    if  @bike.update(bike_params)
      flash[:notice] = "was successfully updated"
      redirect_to bike_url(@bike)
    else
      render :action => :edit
    end
  end

  def destroy
    flash[:alert] = "was successfully deleted"
    @bike.destroy

    redirect_to bikes_url
  end

  private

  def set_bike
    @bike=Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name, :description, :category_id)
  end


end
