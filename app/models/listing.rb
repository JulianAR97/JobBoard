class Listing < ApplicationRecord
  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags

  validates :title, length: {in: 5..50}
  validates :difficulty, inclusion: { in: %w(easy medium hard), message: "%{value} is not a valid difficulty" }
  validates :price, numericality: { only_integer: true }
  validates :content, length: { in: 100..1000 }
  def creator_name
    user.email
  end



end

