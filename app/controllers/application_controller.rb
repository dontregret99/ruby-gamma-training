class ApplicationController < ActionController::Base
  def create_user
  #   ActiveRecord::Base.transaction do
  #     exsiting_deleted_user = User.only_deleted.find_by_email(user_params[:email])
  #     exsiting_deleted_user.really_destroy! if exsiting_deleted_user.present?

  #     @user = User.new(user_params)

  #     @user.set_default_password
  #     @user.set_random_username
  #     @user.created_by = current_user
  #     @user.add_role(:user)

  #     if @user.save!
  #       Mailer.send_confirmation_email(@user)
  #       render json: {success: true}
  #     end
  #   end

  # rescue ActiveRecord::RecordInvalid
  #   render json: {success: false}
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
