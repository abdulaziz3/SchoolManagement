class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :f_name
      t.string :l_name
      t.string :phone
      t.date :dob
      t.string :job
      t.string :work_phone

      t.timestamps null: false
    end
  end
end
