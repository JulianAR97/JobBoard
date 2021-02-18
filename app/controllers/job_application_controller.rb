class JobApplicationController < ApplicationController

  def create
    binding.pry
    @job_application = JobApplication.new(job_application_params)
  end



end
