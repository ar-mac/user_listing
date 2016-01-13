class ProjectsController < ApplicationController
  expose(:project, attributes: :project_params)

  def create
    if project.save
      redirect_to users_path, notice: I18n.t('projects.notice.created')
    else
      render 'new'
    end
  end

  def update
    if project.save
      redirect_to users_path, notice: I18n.t('projects.notice.updated')
    else
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = if project.destroy
                       I18n.t('projects.notice.destroyed')
                     else
                       I18n.t('projects.notice.not_destroyed')
                     end

    redirect_to users_path
  end

  private

  def project_params
    params.require(:project).permit(:name, user_ids: [])
  end
end
