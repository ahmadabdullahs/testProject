class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :user_type, default: 'Manager'

      t.timestamps
    end
  end
end
