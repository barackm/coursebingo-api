class User < ApplicationRecord
    has_secure_password
    has_many :courses, foreign_key: :author_id
    has_many :favourites
    validates :first_name, presence: true, length: {minimum: 3, maximum: 250}
    validates :last_name, presence: true, length: {minimum: 3, maximum: 250}
    validates :email, presence: true, length: {minimum: 13, maximum: 250}
    validates :password, presence: true, length: {minimum: 6, maximum: 250}
    validates :password_confirmation, presence: true, length: {minimum: 6, maximum: 250}
end
