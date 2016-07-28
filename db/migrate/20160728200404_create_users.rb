class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest
      t.string :auth_token
      t.string :first_name
      t.string :last_name
      t.string :avatar_url
      t.string :sf_contact_uid

      t.timestamps
    end
  end
end
