class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
