class User < ApplicationRecord
  before_create :set_user_not_admin

  has_secure_password
  has_many :courses, foreign_key: :author_id, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favorite_courses, through: :favourites, source: :course
  validates :first_name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 13, maximum: 250 },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true, length: { minimum: 6, maximum: 250 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 250 }

  def set_user_not_admin
    self.is_admin = false
  end
end
