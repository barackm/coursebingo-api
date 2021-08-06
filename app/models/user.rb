class User < ApplicationRecord
    has_many :courses, class_name: "course", foreign_key: "author_is"
end
