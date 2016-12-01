class CitiesController < ApplicationController
  before_action :current_user_must_be_city_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_city_user
    city = City.find(params[:id])

    unless current_user == city.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @cities = current_user.cities.page(params[:page]).per(10)

    render("cities/index.html.erb")
  end

  def show
    @city = City.find(params[:id])

    render("cities/show.html.erb")
  end

  def new
    @city = City.new

    render("cities/new.html.erb")
  end

  def create
    @city = City.new

    @city.user_id = params[:user_id]
    @city.temp_c = params[:temp_c]
    @city.temp_f = params[:temp_f]
    @city.weather = params[:weather]
    @city.city_name = params[:city_name]

    save_status = @city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cities/new", "/create_city"
        redirect_to("/cities")
      else
        redirect_back(:fallback_location => "/", :notice => "City created successfully.")
      end
    else
      render("cities/new.html.erb")
    end
  end

  def edit
    @city = City.find(params[:id])

    render("cities/edit.html.erb")
  end

  def update
    @city = City.find(params[:id])

    @city.user_id = params[:user_id]
    @city.temp_c = params[:temp_c]
    @city.temp_f = params[:temp_f]
    @city.weather = params[:weather]
    @city.city_name = params[:city_name]

    save_status = @city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cities/#{@city.id}/edit", "/update_city"
        redirect_to("/cities/#{@city.id}", :notice => "City updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "City updated successfully.")
      end
    else
      render("cities/edit.html.erb")
    end
  end

  def destroy
    @city = City.find(params[:id])

    @city.destroy

    if URI(request.referer).path == "/cities/#{@city.id}"
      redirect_to("/", :notice => "City deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "City deleted.")
    end
  end
end
