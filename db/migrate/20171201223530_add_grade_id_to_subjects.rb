class AddGradeIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :grade_id, :integer
  end
end
