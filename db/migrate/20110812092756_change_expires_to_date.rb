class ChangeExpiresToDate < ActiveRecord::Migration
  def self.up
  	change_column :accounts, :expires_at, :date
  end

  def self.down
  end
end
