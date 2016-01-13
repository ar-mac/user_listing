class ProjectsController < ApplicationController
  expose(:project, attributes: :project_params)

  def create
    if project.save
      # it's a good practice to keep translations in i18n'f files
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
    # it might happen that somehow project wont be deleted
    project.destroy
    redirect_to users_path, notice: 'project deleted'
  end

  private

  def project_params
    params.require(:project).permit(:name, user_ids: [])
  end
end
