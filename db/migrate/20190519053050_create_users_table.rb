class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :email 
      u.string :password_digest
    end
  end
end
