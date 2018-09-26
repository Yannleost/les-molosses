# 1 : Start by destroying everything
# Use methods with ! to raise errors
p "Cleaning users from DB..."
User.destroy_all

p "seeding one user"

  User.create!(
	   email: "guillaume.aa@gmail.com",
	   password: "azerty"
	)

  User.create!(
    email: "yannleost@gmail.com",
    password: "azerty"
  )

p "user created, let's seed dogs"


12.times do

  pictures_array = ["dog1", "dog3", "dog4", "dog5", "dog6" ]
   addresses = ["goncourt, paris", "sentier, paris", "madelaine, paris", "7 rue auguste barbier, paris", "5 rue d'alançon, paris", "1 rue des petits carreaux, paris", "Arc de triomphe, paris", "Tour effeil, paris", "place de l'étoile, Paris"]
  dog = Dog.new(
    nickname: Faker::Coffee.variety,
    size: Faker::Number.between(10, 150),
    breed: "brown",
    user: User.all.sample,
    picture: pictures_array.shuffle.sample,
    address: addresses.sample,
    price: "100"
    )
  dog.save
 end

 p "dog & user seeded"
