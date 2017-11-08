class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :dob
      t.string :password_digest
      t.string :nationality
      t.string :national_id
      t.string :gender

      t.timestamps null: false
    end
  end
end
