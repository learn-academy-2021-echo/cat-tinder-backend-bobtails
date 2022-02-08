# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

birds = [
  {
    id: 1,
    name: "Shelby",
    age: 18,
    enjoys: "late night feather ruffling",
    image:"https://funnyness.com/sites/default/files/images/i/10-2020/funny-bird-wear-lipstick.jpg"
    
  },
  {
    id: 2,
    name: "Aaron",
    age: 8,
    enjoys: "having his name pronounced correctly!",
    image:
      "https://funnyness.com/sites/default/files/images/i/07-2019/funny-birds-glasses.jpg",
  },
  {
    id: 3,
    name: "Bobo",
    age: 12,
    enjoys: "staring into your soul",
    image:
      "http://4.bp.blogspot.com/-Psk4t610Vc0/To-xxwXEmqI/AAAAAAAAARI/sw6xWb24In4/s1600/Funny+Bird.jpg",
  },
];

birds.each do |value|
  Bird.create value
  p 'creating the bird attributes ${value}'
end