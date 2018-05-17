class AddUserLectures < ActiveRecord::Migration
  def change
    add_column :textbooks, :user_lecture, :integer, :default => 1
  end
end
