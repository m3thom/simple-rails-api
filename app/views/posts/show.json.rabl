child(@post, root: :data) do
  attributes :id, :content
end

node(:type) { Post.name }
