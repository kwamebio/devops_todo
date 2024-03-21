class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :id

  belongs_to :user
end
