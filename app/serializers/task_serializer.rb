class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :body
end
