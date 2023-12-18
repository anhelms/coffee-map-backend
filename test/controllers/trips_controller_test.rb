require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/trips.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Trip.count, data.length
  end

  test "create" do
    assert_difference "Trip.count", 1 do
      post "/trips.json", params: { user_id: 1, coffee_shops_id: 1 }
      assert_response 200
    end
  end

  test "show" do
    get "/trips/#{Trip.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "coffee_shops_id", "created_at", "updated_at"], data.keys
  end

  test "update" do
    trip = Trip.first
    patch "/trips/#{trip.id}.json", params: { user_id: "Updated user_id" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal 0, data["user_id"]
  end

  test "destroy" do
    assert_difference "Trip.count", -1 do
      delete "/trips/#{Trip.first.id}.json"
      assert_response 200
    end
  end
end
