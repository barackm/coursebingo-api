require 'rails_helper'
describe 'the favourite feature', type: :feature do
  it 'should not add to favourites a course if no user_id is passed' do 
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '12', password_confirmation: '12')
    course = Course.create(name: 'javascript',price: '40', description: "this is the description of the course", author_id: user.id, duration: '2');
    favourite = Favourite.new(course_id: course.id )
    expect(user.save).to be(false)
  end

  it 'should not add to favourites a course if no course_id is passed' do 
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '12', password_confirmation: '12')
    course = Course.create(name: 'javascript',price: '40', description: "this is the description of the course", author_id: user.id, duration: '2');
    favourite = Favourite.new(user_id: user.id )
    expect(user.save).to be(false)
  end

  it 'should not add to favourites a course if the user_id id invalid' do 
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '12', password_confirmation: '12')
    course = Course.create(name: 'javascript',price: '40', description: "this is the description of the course", author_id: user.id, duration: '2');
    favourite = Favourite.new(user_id: 50, course_id: course.id )
    expect(user.save).to be(false)
  end

  it 'should not add to favourites a course if the course_id id invalid' do 
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456', password_confirmation: '12')
    course = Course.create(name: 'javascript',price: '40', description: "this is the description of the course", author_id: user.id, duration: '2');
    favourite = Favourite.new(user_id: user.id, course_id: 10 )
    expect(user.save).to be(false)
  end

  it 'should add to favourites a course if the course_id and user_id are valid' do 
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456', password_confirmation: '123456')
    course = Course.create(name: 'javascript', price: '40', description: "this is the description of the course", author_id: user.id, duration: '2');
    favourite = Favourite.new(user_id: user.id, course_id: course.id )
    expect(user.save).to be(true)
  end
end