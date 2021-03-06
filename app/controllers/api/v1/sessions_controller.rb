class Api::V1::SessionsController < Api::V1::BaseController
  #用户登录
  def create
    @user = User.find_by(email: create_params[:email])
    if @user && @user.authenticate(create_params[:password])
      self.current_user = @user
    else
      return api_error(status: 401)
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password, :remember)
  end
end
