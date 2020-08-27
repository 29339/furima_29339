class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to index
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day)
  end
end
