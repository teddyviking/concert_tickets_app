class ConcertsController < ApplicationController
  def index
    @concerts = Concert.where(city: params[:city])
    no_concert_found(params) if @concerts.empty?
  end  



  private

  def no_concert_found(params)
    if given_city?(params)
      no_city_given
    else
      flash[:error] = "There is no concerts in #{params[:city]}"
      render 'site/index', status: 404
    end
  end 

  def given_city?(params)
    !params[:city] || params[:city].empty?
  end
  
  def no_city_given
    flash[:error] = 'You should provide a city'
    render 'site/index', status: 404
  end
end
