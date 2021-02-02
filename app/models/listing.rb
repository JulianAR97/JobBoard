class Listing < ApplicationRecord
  belongs_to :user

  def creator_name
    user.username
  end
end
