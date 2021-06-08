class CreateUserAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_accounts do |t|
      t.string   :first_name,  null: false, limit: 50
      t.string   :last_name,   null: false, limit: 50
      t.string   :username,    null: false, limit: 50,  unique: true

      t.timestamps
    end
  end
end
