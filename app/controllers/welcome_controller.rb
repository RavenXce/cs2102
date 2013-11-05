class WelcomeController < ApplicationController
  def index
    @carousel = JSON.parse( File.read('app/assets/carousel.json') )["carousel"]
  end
end
