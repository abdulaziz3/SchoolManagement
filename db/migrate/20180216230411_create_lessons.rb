class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :lesson_name
      t.text :lesson_note
      t.string :lesson_file
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
