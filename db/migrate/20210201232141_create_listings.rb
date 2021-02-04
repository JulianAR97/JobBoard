class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :content
      t.string :skill_level
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
