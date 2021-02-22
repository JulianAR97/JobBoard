module JobApplicationHelper

  def already_applied?
    JobApplication.where(applicant: current_user, listing_id: params[:id]).any?
  end
end
