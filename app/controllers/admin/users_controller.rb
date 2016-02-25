class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = t ".success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".edit_success"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:warning] = t ".delete_fail"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :email, :name, :chatwork_id, :password,
      :password_confirmation
  end
end
