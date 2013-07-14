class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :email
      t.string :verification
      t.string :account_type
      t.string :expires_at

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
