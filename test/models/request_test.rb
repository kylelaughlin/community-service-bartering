require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  
  test "request object valid upon normal creation" do
    @request = Request.new(title: "Example Title", description: "Need work done on house",
                            user_id: 1)
    assert(@request.valid?, "Should be valid under normal circumstances")
  end

  test "Should be invalid without title" do
    @request = Request.new(title: "Example Title", description: "Need work done on house",
                            user_id: 1)
    @request.title = nil
    refute(@request.valid?, "Should be invalid with a nil title")
  end

  test "Should be invalid without description" do
    @request = Request.new(title: "Example Title", description: "Need work done on house",
                            user_id: 1)
    @request.description = nil
    refute(@request.valid?, "Should be invalid with a nil description")
  end

  test "Should be invalid without user_id" do
    @request = Request.new(title: "Example Title", description: "Need work done on house",
                            user_id: 1)
    @request.user_id = nil
    refute(@request.valid?, "Should be invalid with a nil user_id")
  end
end
