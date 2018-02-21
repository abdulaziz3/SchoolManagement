class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :homework_name
      t.text :description
      t.integer :marking
      t.integer :user_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
