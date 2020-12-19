class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest, :null => false
      t.string :zipcode
      t.text :profile_pic

      t.timestamps
    end
  end
end
