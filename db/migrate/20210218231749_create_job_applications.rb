class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.integer :applicant_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
