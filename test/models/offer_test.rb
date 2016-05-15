require 'test_helper'

class OfferTest < ActiveSupport::TestCase

  test "offer valid under normal circumstances" do
    @offer = Offer.new(proposed_hours: 2, user_id: 1, request_id: 2)
    assert(@offer.valid?, "Should be valid offer under normal circumstances")
  end

  test "should be invalid with no user_id" do
    @offer = Offer.new(proposed_hours: 2, user_id: 1, request_id: 2)
    @offer.user_id = nil
    refute(@offer.valid?, "Should be invalid offer with no user_id")
  end

  test "should be invalid with no request_id" do
    @offer = Offer.new(proposed_hours: 2, user_id: 1, request_id: 2)
    @offer.request_id = nil
    refute(@offer.valid?, "Should be invalid offer with no request_id")
  end

  test "should be invalid with no proposed_hours" do
    @offer = Offer.new(proposed_hours: 2, user_id: 1, request_id: 2)
    @offer.proposed_hours = nil
    refute(@offer.valid?, "Should be invalid offer with no proposed_hours")
  end

  test "should be invalid with negative proposed_hours" do
    @offer = Offer.new(proposed_hours: 2, user_id: 1, request_id: 2)
    @offer.proposed_hours = -2
    refute(@offer.valid?, "Should be invalid offer with a negative proposed_hours")
  end

  test "should be valid offer with proposed_hours" do
    @offer = Offer.new(proposed_hours: 2, user_id: 1, request_id: 2)
    @offer.proposed_hours = 0
    assert(@offer.valid?, "Should be valid offer with zero proposed_hours")
  end

end
