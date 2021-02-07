module ListingsHelper
  def show_listing(listing)
    if listing.user == current_user
      link_to listing.title, user_listing_path(current_user, listing)
    else
      link_to listing.title, listing_path(listing)
    end
  end

  # only allows users to choose between 3 skill levels in form
  def valid_skill_levels
    %w[beginner intermediate expert]
  end

  # for use with _collection.html.erb
  def check_box_options
    [:tag_ids, Tag.order(:name), :id, :name]
  end

  def radio_button_options
    [:skill_level, valid_skill_levels, :to_s, :to_s, {}, required: true]
  end

  # drys up code so that you don't have to specify whole path in _form.html.erb
  def partial_path(path)
    "listings/form_partials/#{path}"
  end

  # generates html classes for styling purposes
  def custom_collect_class(cllt_type, resource)
    cllt_type == 'check_box' ? get_tag_class(resource.object.name) : resource.text
  end

  # filter
  def filter_options
    ['newest', 'alphabetical', 'lowest pay', 'highest pay']
  end

  def filter_listings(listings, filter_params)
    case filter_params
    when 'newest'
      filter_by_newest(listings)
    when 'alphabetical'
      filter_alphabetical(listings)
    when 'lowest pay'
      filter_by_pay(listings, filter_params)
    when 'highest pay'
      filter_by_pay(listings, filter_params)
    else
      listings
    end
  end

  def filter_by_newest(listings)
    listings.order(updated_at: :desc)
  end

  def filter_alphabetical(listings)
    listings.sort { |l1, l2| l1.title.casecmp(l2.title) }
  end

  def filter_by_pay(listings, filter_params)
    filter_params == 'lowest pay' ? order_dir = :asc : order_dir = :desc
    listings.order(price: order_dir)
  end

end
