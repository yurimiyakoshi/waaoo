class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
     t.integer :number
     t.integer :absence
     t.references :contribution
     t.references :user
     t.references :user_lecture
     t.timestamps null: false
    end
  end
end
