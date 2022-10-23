class AddDetailsToLoginUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :login_users, :name, :string
    add_column :login_users, :profile, :text
  end
end
