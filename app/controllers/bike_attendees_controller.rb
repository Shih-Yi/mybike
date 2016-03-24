class BikeAttendeesController < ApplicationController
  def create
    @bike = Bike.find(params[:bike_id])
    @attendee = @bike.attendees.create(params[:attendee].permit(:name, :body))

    redirect_to bike_path(@bike)
  end
end
