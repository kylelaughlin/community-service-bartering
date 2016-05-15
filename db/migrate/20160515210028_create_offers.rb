class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :explanation
      t.decimal :proposed_hours, :precision => 16, :scale => 2, null: false
      t.integer :user_id, null: false
      t.integer :request_id, null: false

      t.timestamps null: false
    end
  end
end
