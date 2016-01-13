class AddTableUsersProjects < ActiveRecord::Migration
  def change
    create_table :users_projects, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      # these indexes are wrong, as you add indexes per user or per project
      # index should be created for a pair (user and project) e.g.
      # add_index :users_projects, %w(user_id project_id), name: 'index_users_projects_on_user_id_and_project_id'
    end
  end
end
