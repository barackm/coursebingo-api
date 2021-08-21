require 'rails_helper'
describe 'courses managment processs', type: :feature do
  it 'should not save a course without the name' do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456')
    course = Course.new(description: 'this is the description of the course', author_id: user.id, price: '20',
                        duration: '2')
    expect(course.save).to be(false)
  end

  it 'should not save a course without the price' do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456')
    course = Course.new(name: 'javascript', description: 'this is the description of the course', author_id: user.id,
                        duration: '2')
    expect(course.save).to be(false)
  end

  it 'should not save a course without the description' do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456')
    course = Course.new(name: 'javascript', price: '40', author_id: user.id, duration: '2')
    expect(course.save).to be(false)
  end

  it 'should save a course if all the information is passed' do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456')
    course = Course.new(name: 'javascript', price: '40', description: 'this is the description of the course',
                        author_id: user.id, duration: '2')
    expect(course.name).to eql('javascript')
  end
end
