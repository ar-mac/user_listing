class UsersController < ApplicationController

  expose(:user, attributes: :user_params)
  expose(:found_users) { User.search(search_params, order: order_params, include: :projects) }
  expose(:projects) { Project.all }

  def create
    if user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, project_ids: [])
  end

  def search_params
    params.fetch(:search, {})[:q].present? ? params[:search][:q] : '*'
  end

  def order_params
    params[:order]
  end
end
