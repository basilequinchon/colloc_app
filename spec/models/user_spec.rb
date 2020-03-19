require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) do
    {
      first_name: "Basile",
      last_name: "Quinchon",
      email: "basile@quinchon.com",
      password: "123456"
    }
  end

  it "has a first name" do
    user = User.new(first_name: "Basile")
    expect(user.first_name).to eq("Basile")
  end

  it "has a last name" do
    user = User.new(last_name: "Quinchon")
    expect(user.last_name).to eq("Quinchon")
  end

  it "has an email" do
    user = User.new(email: "basile@quinchon.com")
    expect(user.email).to eq("basile@quinchon.com")
  end

  it "has a password" do
    user = User.new(password: "123456")
    expect(user.password).to eq("123456")
  end

  it "First and Last Name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:last_name)
    attributes.delete(:first_name)
    user = User.new(attributes)
    expect(user).not_to be_valid
  end

  it "Email and password cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:email)
    attributes.delete(:password)
    user = User.new(attributes)
    expect(user).not_to be_valid
  end

  it "has many flats" do
    user = User.new(valid_attributes)
    expect(user).to respond_to(:flats)
    expect(user.flats.count).to eq(0)
  end
end
