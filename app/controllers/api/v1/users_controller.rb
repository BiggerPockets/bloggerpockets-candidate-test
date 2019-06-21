class Api::V1::UsersController < ApiController
  before_action :find_user, only: [:show]

  def show
    render json: { data: {
                            user: @user
                         } }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end