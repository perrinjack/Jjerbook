# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    puts 'CREATE'
    @post.save
    @post.errors.full_messages
    redirect_to posts_url
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def index
    @posts = Post.all
    puts 'ALL'
  end

  def destroy
    puts params
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def update
    @post = Post.find_by(id: params[:id])
    puts params[:message]
    @post.update(message: 'hello')
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
