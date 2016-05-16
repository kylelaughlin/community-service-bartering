class ChangeRequestsAcceptance < ActiveRecord::Migration
  def change
    rename_column :requests, :accepted_bid_id, :accepted_offer_id
  end
end
