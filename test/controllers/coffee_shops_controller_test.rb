require "test_helper"

class CoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/coffee_shops.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal CoffeeShop.count, data.length
  end

  test "create" do
    assert_difference "CoffeeShop.count", 1 do
      post "/coffee_shops.json", params: { name: "Coffee Signal", latitude: "34.0750", longitude: "118.3097" }
      assert_response 200
    end
  end

  test "show" do
    get "/coffee_shops/#{CoffeeShop.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "latitude", "longitude", "created_at", "updated_at"], data.keys
  end

  test "update" do
    coffee_shop = CoffeeShop.first
    patch "/coffee_shops/#{coffee_shop.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "CoffeeShop.count", -1 do
      delete "/coffee_shops/#{CoffeeShop.first.id}.json"
      assert_response 200
    end
  end
end
