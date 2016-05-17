class VenuesController < ApplicationController
  before_filter :authicate_user!, except: [:show, :index]
  def index
    @venues = Venue.all
  end

  def show

  end

  def update

  end

  def destroy

  end
end
