class ListingsController < ApplicationController
  before_action :validate_ownership, only: %i[edit update destroy]

  def index
    if params[:listing]
      # filter by filter params, or...
      @listings = helpers.filter_listings(select_listings, listing_params[:filter_data])
    else
      # ...default to filtering by newest
      @listings = helpers.filter_by_newest(select_listings)
    end
  end

  def show
    if params[:user_id]
      validate_ownership
    else
      @listing = Listing.find(params[:id])
    end
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
    listing = Listing.find(params[:id])
    if listing&.destroy
      redirect_to user_listings_path(current_user)
    else
      redirect_to listings_path
    end
  end

  private

  def validate_ownership
    listing = Listing.find_by(user: current_user, id: params[:id])
    if listing
      @listing = listing
    else
      if params[:user_id]
        redirect_to user_listings_path(current_user), notice: "You do not have acess to that listing"
      else
        redirect_to listings_path, notice: "You do not have access to that listing"
      end
    end
  end

  def listing_params
    params.require(:listing).permit(%i[title description skill_level filter_data price], tag_ids: []) || nil
  end

  def select_listings
    if params[:tag]
      Listing.select { |l| l.tag_names.include? params[:tag] }
    elsif params[:skill_level]
      Listing.select { |l| l.skill_level == params[:skill_level] }
    elsif params[:user_id]
      Listing.where(user_id: params[:user_id])
    else
      Listing.all
    end
  end
end
