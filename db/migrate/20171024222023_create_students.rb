class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :f_name
      t.string :l_name
      t.string :nationality
      t.string :address
      t.string :city
      t.string :post_code
      t.string :gender
      t.string :phone
      t.string :email
      t.string :dob
      t.string :username
      t.string :password_digest
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
