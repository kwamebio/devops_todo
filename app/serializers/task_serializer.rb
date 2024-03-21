class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :body

  belongs_to :user
end
