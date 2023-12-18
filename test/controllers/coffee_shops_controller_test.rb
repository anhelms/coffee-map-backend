require "test_helper"

class CoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/coffee_shops.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal CoffeeShop.count, data.length
  end
end
