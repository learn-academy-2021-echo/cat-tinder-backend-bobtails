require 'rails_helper'


RSpec.describe "Birds", type: :request do
  describe "GET /index" do
    it 'gets a list of birds' do
    Bird.create(
      name: 'Lenny',
      age: 3,
      enjoys: 'tweeting his ass off',
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
          enjoys: 'tweeting his ass off',
          image: 'http'
        }
      }
      post '/birds', params: bird_params

      expect(response).to have_http_status(200)
      bird = Bird.first
  
      expect(bird.name).to eq('Lenny')
      expect(bird.age).to eq(3)
      expect(bird.enjoys).to eq('tweeting his ass off')
      expect(bird.image).to eq('http')
    end
  end
  # describe "PATCH /update" do
  #   it 'updates a bird' do
  #     bird_params = {
  #          bird: {
  #         name: 'Lenny',
  #         age: 3,
  #         enjoys: 'tweeting',
  #         image: 'http'
  #       }
  #     }
  #     post '/birds', params: bird_params

  #     bird_params = {
  #       bird: {
  #      name: 'Hobo',
  #      age: 13,
  #      enjoys: 'eating out',
  #      image: 'https://'
  #    }
  #  }
  #  patch '/birds/:id', params: bird_params


  #     expect(response).to have_http_status(200)
  #     bird = Bird.first
  
  #     expect(bird.name).to eq('Hobo')
  #     expect(bird.age).to eq(13)
  #     expect(bird.enjoys).to eq('eating out')
  #     expect(bird.image).to eq('https://')
  #   end 
  # end

  it "doesn't create a bird without a name" do
    bird_params = {
      bird: {
        age: 5,
        enjoys: 'Walks in the park',
        image: 'https://i.natgeofe.com/n/6f9b6d9e-5797-4867-a859-7b0c2a66cd3b/02-bird-of-paradise-A012_C010_1029SF_0001575.jpg'
      }
    }
    post '/birds', params: bird_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end
  it "doesn't create a bird without an age" do
    bird_params = {
      bird: {
        name: 'Bobo',
        enjoys: 'Walks in the park',
        image: 'https://i.natgeofe.com/n/6f9b6d9e-5797-4867-a859-7b0c2a66cd3b/02-bird-of-paradise-A012_C010_1029SF_0001575.jpg'
      }
    }
    post '/birds', params: bird_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['age']).to include "can't be blank"
  end
  it "doesn't create a bird without an age" do
    bird_params = {
      bird: {
        name: 'Bobo',
        age: 5,
        image: 'https://i.natgeofe.com/n/6f9b6d9e-5797-4867-a859-7b0c2a66cd3b/02-bird-of-paradise-A012_C010_1029SF_0001575.jpg'
      }
    }
    post '/birds', params: bird_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['enjoys']).to include "can't be blank"
  end
  it "doesn't create a bird without an image" do
    bird_params = {
      bird: {
        name: 'Bobo',
        age: 5,
        enjoys: 'Walks in the park',
      }
    }
    post '/birds', params: bird_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['image']).to include "can't be blank"
  end
  it "doesn't create a bird where enjoys is less than 10 characters" do
    bird_params = {
      bird: {
        name: 'Bobo',
        age: 5,
        enjoys: 'Walks',
        image: 'https://i.natgeofe.com/n/6f9b6d9e-5797-4867-a859-7b0c2a66cd3b/02-bird-of-paradise-A012_C010_1029SF_0001575.jpg'
      }
    }
    post '/birds', params: bird_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['enjoys']).to include "is too short (minimum is 10 characters)"
  end
end