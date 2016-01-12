class ProjectsController < ApplicationController
  expose(:project, attributes: :project_params)

  def create
    if project.save
      redirect_to users_path, notice: 'project created'
    else
      render 'new'
    end
  end

  def update
    if project.save
      redirect_to users_path, notice: 'project updated'
    else
      render 'edit'
    end
  end

  def destroy
    project.destroy
    redirect_to users_path, notice: 'project deleted'
  end

  private

  def project_params
    params.require(:project).permit(:name, user_ids: [])
  end
end
