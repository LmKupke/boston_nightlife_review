class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :venue_id, null: false
      t.text :description, null: false
      t.integer :venue_rating, null: false

      t.timestamps null: false
    end
  end
end
