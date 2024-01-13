# User.create!([
#   {name: "John", email: "john@test.com", password: "password", image_url: "https://pbs.twimg.com/profile_images/1237550450/mstom_400x400.jpg"},
#   {name: "Joanna", email: "joanna@test.com", password: "password", image_url: "https://www.womenshistory.org/sites/default/files/styles/main_image/public/images/2021-03/RuthBaderGinsburg_Square.jpg"},
#   {name: "Tiger", email: "tiger@test.com", password: "password", image_url: nil}
# ])
CoffeeShop.create!([
  {name: "Alibi Coffee Co.", latitude: "34.0433", longitude: "-118.3082", image_url: "https://s3-media0.fl.yelpcdn.com/bphoto/oTvnOCDnxEBRQB_BiRxbPA/348s.jpg"},
  {name: "Classic Coffee", latitude: "34.1373", longitude: "-117.8653", image_url: "https://ir.4sqi.net/img/general/original/694771_y9SMQ7tkM6y5Dx85TsEHIWv3wC8WryB9G0i_KsRj92w.jpg"},
  {name: "Bricks and Scones", latitude: "34.0777", longitude: "-118.3239", image_url: "https://i0.wp.com/coffeewall.com/wp-content/uploads/2020/10/Bricks-Scones.png?fit=1000%2C1000&ssl=1"},
  {name: "Tierra Mia Coffee", latitude: "34.0782", longitude: "-118.2628", image_url: "https://pbs.twimg.com/media/DM7hWqzUMAEJ4HU.jpg"},
  {name: "Rubies+Diamonds", latitude: "34.0982", longitude: "-118.3225", image_url: "https://s3-media0.fl.yelpcdn.com/bphoto/-I-5_w_QGCvVYDA0758QEA/348s.jpg"},
  {name: "Cafecito Organico", latitude: "34.0804", longitude: "-118.2843", image_url: "https://s3-media0.fl.yelpcdn.com/bphoto/Wit4xehAlAExD_TwI9VMyg/348s.jpg"},
  {name: "B TwentyFour", latitude: "34.0738", longitude: "-118.217", image_url: "https://s3-media0.fl.yelpcdn.com/bphoto/ANelAz2iJqf89pLuYdMcKw/348s.jpg"},
  {name: "Coffee Commissary", latitude: "34.1739", longitude: "-118.2807", image_url: "https://cdn.vox-cdn.com/thumbor/F2ihAzvMcWiWA7gcwuxljVujzhQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22134752/1229863639.jpg"},
  {name: "Coffee Signal", latitude: "34.075", longitude: "-118.3097", image_url: "https://s3-media0.fl.yelpcdn.com/bphoto/dxwK61qC2JaOeVV1ohjyfw/348s.jpg"},
  {name: "Groundworks Coffee Co.", latitude: "34.07492997", longitude: "-118.32340097", image_url: "https://www.sprudgemaps.com/wp-content/uploads/2023/01/larch1.jpg"},
  {name: "Republic Of Pie", latitude: "34.1646", longitude: "-118.3731", image_url: "https://nohoartsdistrict.com/wp-content/uploads/2021/06/Republic-of-Pie-Reopens-1.jpg"},
  {name: "Starbucks Larchmont & Beverly", latitude: "34.0749", longitude: "-118.3234", image_url: "https://images.crexi.com/lease-assets/656979/e35082ee5c84416e849ca23702aef4fa_3000x2000_resize.jpg"}
])
Trip.create!([user_id: 1, coffee_shops_id: 1])
Review.create!([
  {coffee_shops_id: 1, trip_id: 1, description: "Lovely atmosphere! This is one of my all time favorite places to grab a coffee and knock out a study session.", rating: 4, user_id: 1, image: nil, image_one: nil, image_two: nil},
  {coffee_shops_id: 2, trip_id: 1, description: "I love the coffee roasts from this place. The Bitches Brew (a nod to Miles Davis) is my go to everyday coffee.", rating: 4, user_id: 2, image: nil, image_one: nil, image_two: nil}
])
Image.create!([
  {image_url: "https://koreatownlosangeles.com/wp-content/uploads/2021/10/coffeesignal.la_241757864_258112406183583_2943665939706211594_n-1.jpg", coffee_shops_id: 1},
  {image_url: "https://www.sprudgemaps.com/wp-content/uploads/2023/01/larch1.jpg", coffee_shops_id: 2}
])

