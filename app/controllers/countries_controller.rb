class CountriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def fetch_cities
    @cities = City.by_country(params[:country_id])
    render partial: 'cities', object: @cities, layout: false
  end
  def index

  end
  def show
    # redirect_to info_country_url
  end
  def info
    @country=Country.find(params[:id])
    render json: @country
  end
  def create
    @country=Country.new(country_params)
    if @country.save
      render json: @country.as_json(include: {
        cities: {
          only: [:id, :name]
        }
      })
    else
      render json: [errors: @country.errors.full_messages]
    end
  end

  def update
    @country=Country.find(params[:id])
    if @country.update(country_params)
      render json: @country.as_json(include: {
        cities: {
          only: [:id, :name]
        }
      })
    else
      render json: [errors: @country.errors.full_messages]
    end
  end

  private

  def country_params
    params.require(:country).permit(:id, :name, cities_attributes: [:id, :name, :_destroy])
  end
end