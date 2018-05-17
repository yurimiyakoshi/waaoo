class UserLectures < ActiveRecord::Migration
  def change
    create_table :user_lectures do |t|
      t.references :contribution
      t.references :user
      t.timestamps null: false
    end
  end
end
