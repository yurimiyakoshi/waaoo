class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.integer :unit
      t.references :contribution
      t.references :user
      t.references :user_lecture
      t.timestamps null: false
    end
  end
end
