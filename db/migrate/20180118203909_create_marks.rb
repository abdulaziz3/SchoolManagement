class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :mark
      t.integer :user_id
      t.integer :student_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
