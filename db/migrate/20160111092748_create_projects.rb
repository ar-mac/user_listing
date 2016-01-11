class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, limit: 20
      t.boolean :active, default: false

      t.timestamps null: false
    end
    add_index :projects, :name
  end
end
