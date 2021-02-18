class JobApplicationMailer < ApplicationMailer

  def new_application_email
    @job_application = params[:job_application]

    mail(to: job_application.email, subject: "Someone Applied to Your Listing")
  end
end
