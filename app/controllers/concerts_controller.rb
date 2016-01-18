class ConcertsController < ApplicationController
  def index
    if !params[:city] || params[:city].empty?
      (flash[:error] = 'You should provide a city') 
      render 'site/index', status: 404
    else
      @concerts = Concert.where(city: params[:city])
      (flash[:error] = "There is no concerts in #{params[:city]}")
      render 'site/index', status: 404
    end
  end   
end
