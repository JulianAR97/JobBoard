class JobApplicationController < ApplicationController

  def create
    listing = Listing.find(params[:listing_id])

    @job_application = JobApplication.new(applicant: current_user, listing: listing)
    binding.pry

    if @job_application.save
      # do stuff
      # Also validate that a person cannot apply twice
      redirect_to listing_path(listing), notice: "You have successfully applied for this job"
    end
  end


  private

  def job_application_params
    params.permit(:listing_id)
  end
end
