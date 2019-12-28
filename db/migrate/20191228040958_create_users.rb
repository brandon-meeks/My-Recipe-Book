class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: true
      t.text :password_digest
    
      t.timestamps
    end
    
  end
end
