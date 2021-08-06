class Course < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :favourites
end
