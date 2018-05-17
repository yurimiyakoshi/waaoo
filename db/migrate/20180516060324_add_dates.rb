class AddDates < ActiveRecord::Migration
  def change
    add_column :user_lectures, :date, :string
    add_column :user_lectures, :number, :integer
  end
end
