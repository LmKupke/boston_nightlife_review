class VenuesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  NEIGHBORHOODS = [ "North End", "Waterfront","Financial District", "Back Bay",
    "Beacon Hill", "Chinatown", "Seaport", "South End", "Roxbury", "Dorchester", "Mattapan", "East Boston", "South Boston", "Jamaica Plain", "Allston", "Brighton", "Brookline", "Cambridge", "Somerville"]

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews.order(created_at: :desc)
    @review = Review.new
  end

  def edit
    venue_id = params[:id]
    @venue = Venue.find(venue_id)
    @neighborhoods = NEIGHBORHOODS.sort
    @method = "patch"
    @url = venue_path
    @label = "Update Business"

    render :edit
  end

  def new
    if current_user != nil
      @venue = Venue.new
      @neighborhoods = NEIGHBORHOODS.sort
      @method = "post"
      @url = venues_path
      @label = "Add Business"
    else
      render :index
    end
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user

    if @venue.save
      redirect_to venue_path(@venue.id)
    else
      @neighborhoods = NEIGHBORHOODS.sort
      render :new
    end
  end

  def update
    venue_id = params[:id]
    @venue = Venue.find(venue_id)


    if @venue.update(venue_params)
      redirect_to venue_path(@venue.id), notice: "Admin successfully updated page"
    else
      @neighborhood = NEIGHBORHOODS.sort
      render :edit
    end
  end

  def destroy

  end


  def venue_params
    params.require(:venue).permit(:vname, :price, :cover, :streetnumber, :streetname, :vtype, :neighborhood)
  end
end
