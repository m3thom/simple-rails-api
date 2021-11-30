class CommentSerializer
  include JSONAPI::Serializer

  belongs_to :post

  attributes :content

end
