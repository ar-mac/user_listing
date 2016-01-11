class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, limit: 40

      t.timestamps null: false
    end
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :email
  end
end
