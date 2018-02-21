class CreateStudentAttendances < ActiveRecord::Migration
  def change
    create_table :student_attendances do |t|
      t.integer :student_id
      t.integer :attendance_description_id
      t.date :date

      t.timestamps null: false
    end
  end
end
