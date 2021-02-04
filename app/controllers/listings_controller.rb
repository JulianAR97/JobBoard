class ListingsController < ApplicationController
  before_action :validate_ownership, only: %i[edit update destroy]

  def index
    params[:user_id] ? @listings = Listing.where(user_id: params[:user_id]) : @listings = Listing.all
  end
  
  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create 
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to user_listing_path(current_user, @listing), notice: "Listing was successfully created"
    else 
      render 'listings/new'
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    if @listing.save 
      redirect_to user_listing_path(current_user, @listing), notice: "Listing was successfully updated"
    else
      render 'listings/edit'
    end
  end

  def destroy

  end

  private

  def validate_ownership
    listing = Listing.find_by(user: current_user, id: params[:id])
    if listing
      @listing = listing
    else
      redirect_to listings_path, notice: "You do not have access to that listing"
    end
  end

  def get_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(%i[title content skill_level price], tag_ids: [])
  end
end
