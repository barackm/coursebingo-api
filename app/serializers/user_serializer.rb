class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar, :is_admin, :created_at, :updated_at
end
