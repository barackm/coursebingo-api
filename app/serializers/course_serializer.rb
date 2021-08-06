class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :about, :image, :created_at, :updated_at, :price, :duration
  belongs_to :author, class_name: "author", foreign_key: "author_id"
end
