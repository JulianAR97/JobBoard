class Listing < ApplicationRecord
  include ListingsHelper

  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  accepts_nested_attributes_for :tags

  before_validation :price_to_integer

  validates :title, length: { in: 5..50 }
  validates :skill_level, inclusion: { in: :valid_skill_levels, full_message: "%{value} is not a valid skill_level" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, length: { in: 100..5000 }
  validates :tags, length: { maximum: 5, message: "You can only select a maximum of 5 tags"}

  def creator_name
    user.email
  end

  def tag_names
    tags.map(&:name)
  end



  private

  # technically this is only needed if the user enters something like 400.00, any other decimal 
  # will be caught before the form is submitted
  def price_to_integer
    self.price = self.price.to_i
  end

end

