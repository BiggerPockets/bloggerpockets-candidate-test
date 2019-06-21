# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    @posts = @user.posts
    respond_to do |format|
      format.html
      format.json { render json: {
                                    data: {
                                            user: @user
                                          }
                                  } }
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
