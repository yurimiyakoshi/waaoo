class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :sentence
      t.references :contribution
      t.references :user
      t.timestamps null: false
    end
  end
end
