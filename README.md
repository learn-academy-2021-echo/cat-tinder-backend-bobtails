# README
    ## JB Comp
$ rails new cat-tinder-backend -d postgresql -T
$ cd cat-tinder-backend
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
$ git remote add origin https://github.com/learn-academy-2021-echo/cat-tinder-backend-bobtails.git
$ git checkout -b main
$ git add .
$ git commit -m "initial commit"
$ git push origin main
$ rails db:create
$ bundle add respec-rails
$ rails generate rspec:install
$ rails server
$ rails generate resource Bird name:string age:integer enjoys:text image:text
$ rails db:migrate
$ rspec spec
$ rails routes
$ rails server




    ## Hickey comp
 1036  git clone https://github.com/learn-academy-2021-echo/cat-tinder-backend-bobtails.git
 1037  cd cat-tinder-backend-bobtails
 1039  git checkout -b backend-structure
 1040  git branch
 1041  git status
 1042  code .
 1043  rails db:create
 1045  rails db:migrate
 1046  rspec spec


  ## in seeds.rb

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



 1048  rails db:seed
 1049  rails c
    - pp Bird.all


     # in code editor - application_controller
    class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
end
    # in Gemfile
    gem 'rack-cors', :require => 'rack/cors'

    # in config/initializers
      - created file cors.rb
      Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

  
 1054  rails c
 1055  bundle