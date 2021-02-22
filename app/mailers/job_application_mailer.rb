class JobApplicationMailer < ApplicationMailer

  def new_job_application_email
    @job_application = params[:job_application]
    file = open(@job_application.resume.url).read
    attachments[@job_application.resume] = file
    mail(to: @job_application.listing.user.email, subject: "Someone Applied to Your Listing")
  end
end
