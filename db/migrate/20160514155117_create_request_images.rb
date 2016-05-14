class CreateRequestImages < ActiveRecord::Migration
  def change
    create_table :request_images do |t|
      t.integer :request_id

      t.timestamps null: false
    end
  end
end
