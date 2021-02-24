class JobApplicationController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
 
    @job_application = JobApplication.new(applicant: current_user, listing: listing)
    
    
    if @job_application.save
      # First we read the tempfile that we get from user upload and save it in a variable
      file = File.read(job_application_params[:resume].tempfile)

      # Next we grab the filename to use with action mailer
      filename = job_application_params[:resume].original_filename
      JobApplicationMailer.with(job_application: @job_application).new_job_application_email(file, filename).deliver

      # Also validate that a person cannot apply twice
      redirect_to listing_path(listing), notice: "You have successfully applied for this job"
    else
      redirect_to listing_path(listing)
    end
  end


  private

  def job_application_params
    params.require(:job_application).permit('resume')
  end

end
