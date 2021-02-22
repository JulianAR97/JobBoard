class JobApplicationMailer < ApplicationMailer

  def new_job_application_email
    @job_application = params[:job_application]
   
    mail(to: @job_application.listing.user.email, subject: "Someone Applied to Your Listing")
  end
end
