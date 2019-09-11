class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(create_params)
    if user
      
    else

    end
  end

  def update
    @user = User.find(params[:id])
    # return api_error(status: 403) if !UserPolicy.new(current_user, @user).update?
    authorize @user, :update?
    @user.update_attributes(update_params)
  end

  private

  def create_params
    params.require(:user).permit(:name, :email, :password, :confirm)
  end

  def update_params
    params.require(:user).permit(:name)
  end
end
