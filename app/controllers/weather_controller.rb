class WeatherController < ApplicationController

  def index
    @q = current_user.cities.ransack(params[:q])
      @cities = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)



  end

end
