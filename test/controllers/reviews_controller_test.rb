require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/reviews.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Review.count, data.length
  end

  test "create" do
    assert_difference "Review.count", 1 do
      post "/reviews.json", params: { coffee_shops_id: 1, trip_id: 1, description: "Lovely atmosphere! This is one of my all time favorite places to grab a coffee and knock out a study session.", rating: 4, user_id: 1 }
      assert_response 200
    end
  end
end
