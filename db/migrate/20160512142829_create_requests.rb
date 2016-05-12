class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.integer :accepted_bid_id
      t.integer :advertised_credits
      t.integer :accepted_credits
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
