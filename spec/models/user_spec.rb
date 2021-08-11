require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:courses) }
    it { should have_many(:favourites) }
    it { should validate_length_of(:first_name) }
    it { should validate_length_of(:last_name) }
    it { should validate_length_of(:email) }
    it { should validate_length_of(:password) }
    it { should validate_length_of(:password_confirmation) }
end