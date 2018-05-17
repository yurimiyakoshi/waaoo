class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :report
      t.datetime :deadline
      t.references :user
      t.references :user_lecture
      t.references :contribution
      t.timestamps null: false
    end
  end
end
