class Tag < ApplicationRecord
  has_many :listing_tags
  has_many :listings, through: :listing_tags

  validates :name, length: {in: 1..10}
  validates :name, uniqueness: true

  before_validation :downcase_name


  def downcase_name
    name.downcase!
  end

end
