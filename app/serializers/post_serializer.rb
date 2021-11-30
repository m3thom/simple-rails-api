class PostSerializer
  include JSONAPI::Serializer

  has_many :comments

  attributes :content

end
