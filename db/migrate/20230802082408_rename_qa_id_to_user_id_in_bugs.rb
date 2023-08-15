class RenameQaIdToUserIdInBugs < ActiveRecord::Migration[7.0]
  def change
    rename_column :bugs, :qa_id, :user_id
  end
end
