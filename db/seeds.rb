# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
 
  pictures_array = ["dog1.jpg", "dog3.jpg", "dog4.jpg", "dog5.jpg", "dog6" ]
   addresses = ["la ville aubert, saint guinoux", "7 rue auguste barbier, saint guinoux", "75 avenue de flandres, croix", "5 rue d'alançon, paris", "1 rue des petits carreaux, paris", "Arc de triomphe, paris", "grand place, Lille", "84 rue benoit malon, Marseille", "place de l'étoile, Paris"]
  dog = Dog.new(
    nickname: Faker::Coffee.variety,
    size: Faker::Number.between(10, 150),
    breed: "brown",
    user: User.all.sample,
    picture: pictures_array.shuffle.sample,
    address: addresses.sample
    )
  dog.save
 end

 p "dog & user seeded"