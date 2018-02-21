class CreateAttendanceDescriptions < ActiveRecord::Migration
  def change
    create_table :attendance_descriptions do |t|
      t.string :att_status

      t.timestamps null: false
    end
  end
end
