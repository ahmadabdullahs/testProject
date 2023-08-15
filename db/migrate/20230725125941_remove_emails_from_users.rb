class RemoveEmailsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :emails
  end
end
