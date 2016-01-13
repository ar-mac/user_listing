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
    # it might happen that somehow project wont be deleted
    project.destroy
    redirect_to users_path, notice: I18n.t('projects.notice.destroyed')
  end

  private

  def project_params
    params.require(:project).permit(:name, user_ids: [])
  end
end
