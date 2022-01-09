class UsersController < ApplicationController
  layout 'simple'

  before_action :set_default_country, only: %i[new create edit]
  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
    @profile = @user.build_profile
  end

  def create
    @user = User.new(user_params)
    @profile = @user.build_profile(profile_params)
    if @user.save
      redirect_to users_url, notice: 'Successfully Created'
    else
      @cities = City.by_country(@user.country_id)
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
    if @user.update(user_params) && @profile.update(profile_params)
      redirect_to users_url, notice: 'Successfully updated'
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @user = User.find(params[:id])
    @profile.destroy
    @user.destroy
    redirect_to users_url, notice: 'Successfully Deleted'
  end

  private

  def set_default_country
    @countries = Country.all
    @cities = City.all
  end

  def user_params
    params.require(:user).permit(:email, :username, :pin, :terms_of_use, :country_id, :city_id)
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :birth_date, :about_me)
  end

end
