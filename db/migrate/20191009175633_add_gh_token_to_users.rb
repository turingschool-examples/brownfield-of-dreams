class AddGhTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gh_token, :string
  end
end
