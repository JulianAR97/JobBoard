class Listing < ApplicationRecord
  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags

  before_validation :price_to_integer

  validates :title, length: { in: 5..50 }
  validates :skill_level, inclusion: { in: %w(beginner intermediate expert), message: "%{value} is not a valid skill_level" }
  validates :price, numericality: { only_integer: true }
  validates :content, length: { in: 100..5000 }

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

