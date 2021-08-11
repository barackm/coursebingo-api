require 'rails_helper'
describe 'the sign up process', type: :feature do
  it 'should not save user without the password confirmation' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456')
    expect(user.save).to be(false)
  end

  it 'should not save user without the password' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com')
    expect(user.save).to be(false)
  end

  it 'should not save user username less than 3 characters' do
    user = User.new(first_name: 'Jo', last_name: 'Doe', email: 'john@gmail.com', password: '123456',
                    password_confirmation: '123456')
    expect(user.save).to be(false)
  end

  it 'should save user with all fields' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456',
                    password_confirmation: '123456')
    user.save
    expect(user.first_name).to eq('John')
  end

  it 'should not save the user with a password less than 6 characters' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '12',
                    password_confirmation: '12')
    expect(user.save).to be(false)
  end
end
