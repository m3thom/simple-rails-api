extends 'shared/base', object: false, locals: { instance: @posts }

child(@posts, root: :data) do
  attributes :id, :content
end

