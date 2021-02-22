class JobApplicationController < ApplicationController

  def create
    listing = Listing.find(params[:listing_id])

    @job_application = JobApplication.new(applicant: current_user, listing: listing)
    
    if @job_application.save
      JobApplicationMailer.with(job_application: @job_application).new_job_application_email.deliver_later

      # Also validate that a person cannot apply twice
      redirect_to listing_path(listing), notice: "You have successfully applied for this job"
    end
  end


  private

  def job_application_params
    params.permit(:listing_id)
  end
end
