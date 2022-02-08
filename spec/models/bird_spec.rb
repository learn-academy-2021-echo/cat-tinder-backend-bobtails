require 'rails_helper'

RSpec.describe Bird, type: :model do
  it "should validate name" do
    bird = Bird.create
    expect(bird.errors[:name]).to_not be_empty
  end
  it "should validate age" do
    bird = Bird.create
    expect(bird.errors[:age]).to_not be_empty
  end
  it "should validate enjoys" do
    bird = Bird.create
    expect(bird.errors[:enjoys]).to_not be_empty
  end
  it "should validate image" do
    bird = Bird.create
    expect(bird.errors[:image]).to_not be_empty
  end
  it "should validate name is greater than 10 characters" do
    bird = Bird.create enjoys: "Eating"
    expect(bird.errors[:enjoys]).to_not be_empty
  end
end