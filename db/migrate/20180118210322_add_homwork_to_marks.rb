class AddHomworkToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :homework_id, :integer
  end
end
