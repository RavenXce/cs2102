class FlightsController < ApplicationController
  def index
    @results = []
    @two_way = true
  end
  
  def search
    render 'index'
  end
end
