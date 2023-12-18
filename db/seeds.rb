# User.create(name: 'John', email: 'john@test.com', password_digest: 'password', image_url: 'https://pbs.twimg.com/profile_images/1237550450/mstom_400x400.jpg' )
# User.create(name: 'Joanna', email: 'joanna@test.com', password_digest: 'password', image_url: 'https://www.womenshistory.org/sites/default/files/styles/main_image/public/images/2021-03/RuthBaderGinsburg_Square.jpg' )

# CoffeeShop.create(name: 'Coffee Signal', latitude: '34.0750', longitude: '118.3097' )
# CoffeeShop.create(name: 'Groundworks Coffee Co.', latitude: '34.0746', longitude: '118.3234' )

Review.create(coffee_shops_id: 1, trip_id: 1, description: "Lovely atmosphere! This is one of my all time favorite places to grab a coffee and knock out a study session.", rating: 4, user_id: 1 )
Review.create(coffee_shops_id: 2, trip_id: 1, description: "I love the coffee roasts from this place. The Bitches Brew (a nod to Miles Davis) is my go to everyday coffee.", rating: 4, user_id: 2 )

