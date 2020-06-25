class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    weather = weather(@trip.city)
    if weather.present?
      @trip.temperature = weather.parsed_response["main"]["temp"]
    end

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])

    @trip.destroy
    redirect_to root_path
  end

  private

  def trip_params
    params.require(:trip).permit(:city, :description, :temperature)
  end

  def weather(city_name)
    HTTParty.post("https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&units=metric&appid=634391c14335800027d7efb5772b11f6")
  end
end
