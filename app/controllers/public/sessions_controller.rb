# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :end_user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def guest_sign_in
    # binding.pry
    user = EndUser.guest
    sign_in user
    redirect_to end_user_path(user), notice: "「ゲストユーザー」でログインしました。"
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
    # ログイン後の遷移先設定
    def after_sign_in_path_for(resource)
      end_user_path(current_end_user.id)
    end
    # ログアウト後の遷移先設定
    def after_sign_out_path_for(resource)
      root_path
    end

    def end_user_state
      end_user = EndUser.find_by(email: params[:end_user][:email])
      if end_user
        if end_user.valid_password?(params[:end_user][:password]) && end_user.is_deleted
          flash[:alert] = "すでに退会したアカウントです。新しくユーザー登録をしてください。"
          redirect_to new_end_user_session_path
        end
      end
    end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
