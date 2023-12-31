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
      post "/reviews.json", params: { coffee_shops_id: CoffeeShop.first.id, trip_id: Trip.first.id, description: "Lovely atmosphere! This is one of my all time favorite places to grab a coffee and knock out a study session.", rating: 4, user_id: User.first.id }
      assert_response 200
    end
  end

  test "show" do
    get "/reviews/#{Review.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "coffee_shops_id", "trip_id", "description", "rating", "user_id", "created_at", "updated_at"], data.keys
  end

  test "update" do
    review = Review.first
    patch "/reviews/#{review.id}.json", params: { description: "Updated description" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated description", data["description"]
  end

  test "destroy" do
    assert_difference "Review.count", -1 do
      delete "/reviews/#{Review.first.id}.json"
      assert_response 200
    end
  end
end
