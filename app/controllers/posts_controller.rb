# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    # used includes(:user) to reduce the # of queries made
    # used .published syntax to use scope
    @posts = Post.includes(:user).published

    if params[:sort].present?
      @posts = @posts.order("created_at #{params[:sort]}")
    end

    #removed respond_to, it was only HTML and HTML is default
  end

  def show
    @post = Post.find(params[:id])
  end

  def comments
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
