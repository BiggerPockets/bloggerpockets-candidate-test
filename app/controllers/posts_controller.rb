# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: [:show, :comments]

  def index
    @posts = Post.where(published: true)
    @posts = @posts.order("created_at #{params[:sort]}") if params[:sort].present?
  end

  def show; end

  def comments
    @comments = @post.comments
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
