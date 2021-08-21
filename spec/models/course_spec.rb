require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:favourites) }
  it { should belong_to(:author).class_name('User') }
  it { should validate_length_of(:name) }
  it { should validate_length_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:duration) }
end
