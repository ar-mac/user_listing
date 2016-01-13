class UsersController < ApplicationController
  expose(:user, attributes: :user_params)
  expose(:q) { User.search(params[:q]) }

  #N+1 query of projects because of https://github.com/activerecord-hackery/ransack#problem-with-distinct-selects
  #tried to resolve but fail
  expose(:found_users) { q.result(distinct: true).includes(:projects).paginate(page: params[:page]) }
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
    flash[:notice] = if user.destroy
                       I18n.t('users.notice.destroyed')
                     else
                       I18n.t('users.notice.not_destroyed')
                     end

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, project_ids: [])
  end
end
