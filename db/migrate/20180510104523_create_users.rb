class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :user_name
      t.string :major
      t.references :university
      t.timestamps null: false
    end
  end
end