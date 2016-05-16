class ChangeProposedHoursToInteger < ActiveRecord::Migration
  def change
    change_column :offers, :proposed_hours, :integer
    change_column :requests, :accepted_credits, :integer
    change_column :users, :credits, :integer
  end
end
