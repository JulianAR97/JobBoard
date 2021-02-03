module ListingsHelper
  def show_listing(listing)
    if listing.user == current_user
      link_to listing.title, user_listing_path(current_user, listing)
    else
      link_to listing.title, listing_path(listing)
    end
  end
end
