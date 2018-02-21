class AddCommentToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :comment, :string
  end
end
