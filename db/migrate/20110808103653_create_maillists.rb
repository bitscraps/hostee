class CreateMaillists < ActiveRecord::Migration
  def self.up
    create_table :maillists do |t|
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :maillists
  end
end
