class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :text
      t.string :text_url
      t.references :contribution
      t.timestamps null: false
    end
  end
end
