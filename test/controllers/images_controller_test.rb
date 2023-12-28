require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/images.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Image.count, data.length
  end

  test "create" do
    assert_difference "Image.count", 1 do
      post "/images.json", params: { image_url: "https://koreatownlosangeles.com/wp-content/uploads/2021/10/coffeesignal.la_241757864_258112406183583_2943665939706211594_n-1.jpg", coffee_shops_id: CoffeeShop.first.id }
      assert_response 200
    end
  end

  test "show" do
    get "/images/#{Image.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "image_url", "coffee_shops_id", "created_at", "updated_at"], data.keys
  end

  test "update" do
    image = Image.first
    patch "/images/#{image.id}.json", params: { image_url: "Updated image_url" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated image_url", data["image_url"]
  end

  test "destroy" do
    assert_difference "Image.count", -1 do
      delete "/images/#{Image.first.id}.json"
      assert_response 200
    end
  end
end
