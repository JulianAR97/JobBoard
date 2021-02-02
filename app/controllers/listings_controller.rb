class ListingsController < ApplicationController
  before_action :match_profile
  def index
    params[:user_id] ? @listings = Listing.where(user_id: params[:user_id]) : @listings = Listing.all
  end

  private

  def match_profile
    if params[:user_id]
      unless User.where(id: params[:user_id]).first == current_user
        if user_signed_in?
          redirect_to root_path
        else 
          flash[:error] = "You must be logged in to access this page"
          redirect_to new_user_session_path
        end
      end
    end
  end
end
