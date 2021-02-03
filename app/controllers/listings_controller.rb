class ListingsController < ApplicationController
  before_action :match_profile
  before_action :get_listing, only: %i[show edit update destroy]
  def index
    params[:user_id] ? @listings = Listing.where(user_id: params[:user_id]) : @listings = Listing.all
  end
  
  def show 
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

  def match_profile
    if params[:user_id]
      unless User.where(id: params[:user_id]).first == current_user
        if user_signed_in?
          flash[:error] = "You do not have access to that page"
          redirect_to root_path
        else 
          flash[:error] = "You must be logged in to access this page"
          redirect_to new_user_session_path
        end
      end
    end
  end

  def get_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(%i[title content difficulty price])
  end
end
