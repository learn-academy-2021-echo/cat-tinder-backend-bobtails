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
          enjoys: 'tweeting his bleep off',
          image: 'http'
        }
      }
      post '/birds', params: bird_params

      expect(response).to have_http_status(200)
      bird = Bird.first
  
      expect(bird.name).to eq('Lenny')
      expect(bird.age).to eq(3)
      expect(bird.enjoys).to eq('tweeting his bleep off')
      expect(bird.image).to eq('http')
    end
  end

  # describe "PATCH /update" do
  #   it 'updates a bird' do
  #     bird_params = {
  #          bird: {
  #         name: 'Lenny',
  #         age: 3,
  #         enjoys: 'tweeting about stuff',
  #         image: 'http'
  #       }
  #     }
  #     post '/birds', params: bird_params
  #     Bird.create(bird_params)
  #     bird = Bird.first
  #     updated_bird = {
  #      name: 'Hobobobo',
  #      age: 13,
  #      enjoys: 'eating out like a champ',
  #      image: 'https'
  #    }
  #    updated_bird_params = {bird: updated_bird}
  #    patch "/birds/#{bird.id}", params: updated_bird_params
  #    bird_2 = Bird.first
  #    bird_2.update(updated_bird)
  #    bird_2 = Bird.first

  #  expect(response).to have_http_status(200)
  #  expect(bird2.name).to eq updated_bird_params[:name]
  #  expect(bird2.age).to eq updated_bird_params[:age]
  #  expect(bird2.enjoys).to eq updated_bird_params[:enjoys]
  #  expect(bird2.image).to eq updated_bird_params[:image]
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