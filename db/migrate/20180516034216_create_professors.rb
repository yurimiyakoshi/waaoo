class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :teacher
      t.string :mail
      t.references :user_lecture
      t.references :contribution
      t.timestamps null: false
    end
  end
end
