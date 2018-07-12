class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
     t.integer :number,   default: 0
     t.integer :absence,   default: 0
     t.references :contribution
     t.references :user
     t.references :user_lecture
     t.timestamps null: false
    end
  end
end
