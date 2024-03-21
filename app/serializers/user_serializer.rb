class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :id

  has_many :tasks
end
