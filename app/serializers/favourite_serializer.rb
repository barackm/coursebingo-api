class FavouriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :course, :created_at, :updated_at
  belongs_to :course
end
