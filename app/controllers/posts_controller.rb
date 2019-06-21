# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.where(published: true)

    if params[:sort].present?
      @posts = @posts.order("created_at #{params[:sort]}")
    end
  end

  def show; end

  def comments
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
