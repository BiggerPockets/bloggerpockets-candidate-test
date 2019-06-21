# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: [:show, :comments]
  before_action :all_published_posts, only: [:index]

  def index
    @posts = @posts.order("created_at #{params[:sort]}") if params[:sort].present?
  end

  def show; end

  def comments
    @comments = @post.comments
  end

  private

  def all_published_posts
    @posts = Post.where(published: true)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
