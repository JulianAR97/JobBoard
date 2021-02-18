class JobApplication < ApplicationRecord
  belongs_to :applicant, class_name: 'User'
  belongs_to :listing

  validate :not_own_listing
  # on create, send emails to applicant and listing owner

  def lister
    listing.user
  end

  def not_own_listing
    if applicant == listing.user
      errors.add(:applicant, 'cannot apply for own listing')
    end
  end
end
