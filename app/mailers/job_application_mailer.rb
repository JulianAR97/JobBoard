class JobApplicationMailer < ApplicationMailer

  def new_job_application_email
    @job_application = params[:job_application]
    
    # file = open(@job_application.resume.url).read

    # use actual name in attachments
    attachments['test_resume.docx'] = File.read('test_resume.docx')
    mail(to: @job_application.listing.user.email, subject: "Someone Applied to Your Listing")
  end
end
