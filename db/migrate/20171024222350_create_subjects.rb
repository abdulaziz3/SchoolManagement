class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.string :subject_code

      t.timestamps null: false
    end
  end
end
