class ApplicationController < ActionController::Base
  def create_user
    created = ActivateUserService.call(user_params)

    if created.success!
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :age
    )
  end
end
