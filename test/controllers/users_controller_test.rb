require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/users.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal User.count, data.length
  end

  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { name: "John", email: "john@test.com", password_digest: "password", image_url: "https://pbs.twimg.com/profile_images/1237550450/mstom_400x400.jpg" }
      assert_response 200
    end
  end
end
