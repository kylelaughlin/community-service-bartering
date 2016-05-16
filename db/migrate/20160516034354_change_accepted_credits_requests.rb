class ChangeAcceptedCreditsRequests < ActiveRecord::Migration
  def change
    change_column :requests, :accepted_credits, :decimal, :precision => 16, :scale => 2
  end
end
