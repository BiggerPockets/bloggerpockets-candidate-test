# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    respond_to do |format|
      format.html
      # used serializer to organize data returned, and hide sensitive data
      format.json { render json: UserSerializer.new(@user).serialized_json }
    end
  end
end
