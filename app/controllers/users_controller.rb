# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    # added .includes to avoid n+1 queries
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.posts

    respond_to do |format|
      format.html
      # used serializer to organize data returned, and hide sensitive data
      format.json { render json: UserSerializer.new(@user).serialized_json }
    end
  end
end
