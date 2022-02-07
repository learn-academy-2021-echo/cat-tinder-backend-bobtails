require 'rails_helper'


RSpec.describe "Birds", type: :request do
  describe "GET /index" do
    it 'gets a list of birds' do
    Bird.create(
      name: 'Lenny',
      age: 3,
      enjoys: 'tweeting',
      image: 'http'
  )
  get '/birds'
  bird = JSON.parse(response.body)
  expect(response).to have_http_status(200)
  expect(bird.length).to eq 1
  end
end
  describe "POST /create" do
    it 'creates a bird' do
      bird_params = {
           bird: {
          name: 'Lenny',
          age: 3,
          enjoys: 'tweeting',
          image: 'http'
        }
      }
      post '/birds', params: bird_params

      expect(response).to have_http_status(200)
      bird = Bird.first
  
      expect(bird.name).to eq('Lenny')
      expect(bird.age).to eq(3)
      expect(bird.enjoys).to eq('tweeting')
      expect(bird.image).to eq('http')
    end
  end
  describe "PATCH /update" do
    it 'updates a bird' do
      bird_params = {
           bird: {
          name: 'Lenny',
          age: 3,
          enjoys: 'tweeting',
          image: 'http'
        }
      }
      post '/birds', params: bird_params

      bird_params = {
        bird: {
       name: 'Hobo',
       age: 13,
       enjoys: 'eating out',
       image: 'https://'
     }
   }
   patch '/birds/:id', params: bird_params


      expect(response).to have_http_status(200)
      bird = Bird.first
  
      expect(bird.name).to eq('Hobo')
      expect(bird.age).to eq(13)
      expect(bird.enjoys).to eq('eating out')
      expect(bird.image).to eq('https://')
    end 
  end
end
