class AddCreditsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credits, :decimal, default: 0
  end
end
