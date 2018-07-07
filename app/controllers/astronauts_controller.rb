class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @avg_age = Astronaut.average_age
  end
end