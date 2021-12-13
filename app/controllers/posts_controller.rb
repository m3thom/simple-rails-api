class PostsController < ApplicationController
  before_action :load_post, only: [:show, :update, :destroy]

  # include ActionController::Helpers
  # helper RablHelper

  def index
    @pagy, @posts = pagy(Post.all)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render 'show'
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render 'show'
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    if @post.destroy
      render 'show'
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

  def post_params
    params
        .require(:post)
        .permit(
            :content
        )
  end
end
