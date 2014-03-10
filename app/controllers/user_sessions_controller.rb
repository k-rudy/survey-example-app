class UserSessionsController < ApplicationController

  layout 'login'

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:surveys, notice: t('login.success_message'))
    else
      flash.now[:error] = t 'login.fail_message'
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to(:login, notice: t('login.logout_message'))
  end
end
