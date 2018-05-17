class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :name
      t.string :place
      t.references :professor
      t.references :university
      t.timestamps null: false
    end
  end
end
