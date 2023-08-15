class AddQaToBugs < ActiveRecord::Migration[7.0]
  def change
    #add_reference :bugs, :qa, null: false, foreign_key: true
    add_reference :bugs, :qa, foreign_key: { to_table: :users }
  end
end
