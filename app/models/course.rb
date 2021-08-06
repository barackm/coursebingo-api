class Course < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :favourites
    validates :name, presence: true, length: {minimum: 3, maximum: 250}
    validates :about, presence: true, length: {minimum: 20, maximum: 250}
    validates :duration, presence: true
    validates :price, presence: true
end
