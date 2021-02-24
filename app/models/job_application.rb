class JobApplication < ApplicationRecord
  belongs_to :applicant, class_name: 'User'
  belongs_to :listing

  validate :not_own_listing
  validate :omnidirectional_uniqueness
  # on create, send emails to applicant and listing owner

  def lister
    listing.user
  end

  def not_own_listing
    if applicant == listing.user
      errors.add(:applicant, 'cannot apply for own listing')
    end
  end

  def omnidirectional_uniqueness
    if self.class.where(applicant_id: applicant.id, listing_id: listing.id).any?
      errors.add(:applicant, 'cannot apply for same listing twice')
    end
  end

end
