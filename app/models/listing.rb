class Listing < ApplicationRecord
  belongs_to :user
  
  validates :title, length: {in: 5..50}
  validates :difficulty, inclusion: { in: %w(easy medium hard), message: "%{value} is not a valid size" }
  validates :price, numericality: { only_integer: true }
  validates :content, length: { in: 100..1000 }
  def creator_name
    user.email
  end



end

