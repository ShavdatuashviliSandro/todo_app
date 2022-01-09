module Api
  class V1::MainController < ApplicationController

    def about
      render json: 'mainis about teqsti'
    end
    def show
      render json: {username: params[:username]}
    end
  end
end