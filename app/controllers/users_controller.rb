class UsersController < ApplicationController
  expose(:user, attributes: :user_params)
  expose(:found_users) { User.search(search_params).includes(:projects).order(order_params).distinct.paginate(page: params[:page]) }
  expose(:projects) { Project.all }

  def create
    if user.save
      redirect_to users_path, notice: I18n.t('users.notice.created')
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to users_path, notice: I18n.t('users.notice.updated')
    else
      render :edit
    end
  end

  def destroy
    # it might happen that somehow project wont be deleted
    user.destroy
    redirect_to users_url, notice: I18n.t('users.notice.destroyed')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, project_ids: [])
  end

  def search_params
    ['%', params.fetch(:search, {})[:q], '%'].join
  end

  def order_params
    params[:order]
  end
end
