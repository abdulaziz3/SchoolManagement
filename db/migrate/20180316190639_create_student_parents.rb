class CreateStudentParents < ActiveRecord::Migration
  def change
    create_table :student_parents do |t|
      t.integer :user_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
