class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.date :start_date
      t.date :end_date
      t.boolean :current_course, default: false

      t.timestamps null: false
    end
  end
end
