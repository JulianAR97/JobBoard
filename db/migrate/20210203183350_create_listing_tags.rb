class CreateListingTags < ActiveRecord::Migration[6.1]
  def change
    create_table :listing_tags do |t|
      t.belongs_to :listing, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
