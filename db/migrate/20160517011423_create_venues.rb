class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :user_id, null:false
      t.string :vname, null:false
      t.integer :price, null:false
      t.boolean :cover, null:false, default: false
      t.integer :streetnumber, null:false
      t.string :streetname, null:false
      t.string :vtype, null:false
      t.string :neighborhood, null:false

      t.timestamps null: false
    end
  end
end
