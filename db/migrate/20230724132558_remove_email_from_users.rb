class RemoveEmailFromUsers < ActiveRecord::Migration[7.0]
  def change
  def up
    remove_column :users, :email
  end

  def down
    add_column :users, :email, :string
  end
  end
end
