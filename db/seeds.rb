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
    name: "Blake",
    age: 18,
    enjoys: "late night feather ruffling",
    image:"https://i.pinimg.com/originals/16/66/51/166651081286be1dd69920c27e89658d.jpg"
    
  },
  {
    id: 2,
    name: "Aaron",
    age: 8,
    enjoys: "having his name pronounced correctly!",
    image:
      "https://i.pinimg.com/originals/14/e6/34/14e63434d7adeb7c87c35fb3b7f49d0d.png",
  },
  {
    id: 3,
    name: "Bobo",
    age: 12,
    enjoys: "staring into your soul",
    image:
      "https://www.pinkvilla.com/imageresize/avengers-endgame-star-mark-ruffalo-celebrates-bruce-banners-50th-birthday-with-an-endearing-post.jpg?width=752&format=webp&t=pvorg",
  },
];

birds.each do |value|
  Bird.create value
  p 'creating the bird attributes ${value}'
end