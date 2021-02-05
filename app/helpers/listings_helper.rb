module ListingsHelper
  def show_listing(listing)
    if listing.user == current_user
      link_to listing.title, user_listing_path(current_user, listing)
    else
      link_to listing.title, listing_path(listing)
    end
  end

  def valid_skill_levels
    %w[beginner intermediate expert]
  end

  def check_box_options
    [:tag_ids, Tag.order(:name), :id, :name, limit: 5]
  end

  def radio_button_options
    [:skill_level, valid_skill_levels, :to_s, :to_s, {}, required: true]
  end

  def partial_path(path)
    "listings/form_partials/#{path}"
  end

  def custom_collect_class(cllt_type, resource)
    cllt_type == 'check_box' ? get_tag_class(resource.object.name) : resource.text
  end

end
