class RenameTableUsersProjects < ActiveRecord::Migration
  def change
    # what is the difference ?
    rename_table :users_projects, :projects_users
  end
end
