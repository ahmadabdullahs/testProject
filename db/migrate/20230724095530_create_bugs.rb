class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.string :screenshot
      t.column :bug_type, :string, default: 'bug', null: false
      t.column :status, :string, default: 'open'
      t.integer :qa_id
      t.timestamps
    end
  end
end

