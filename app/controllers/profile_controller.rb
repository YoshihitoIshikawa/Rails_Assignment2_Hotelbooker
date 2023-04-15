class ProfileController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました。"
      redirect_to :users_profile
    else
      flash[:notice] = "プロフィールの編集に失敗しました。"
      render :profile_edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:image,:introduction)
  end
end
