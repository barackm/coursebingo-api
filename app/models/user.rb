class User < ApplicationRecord
    has_secure_password
    has_many :courses, foreign_key: :author_id
    has_many :favourites
end
