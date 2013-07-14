class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :telephone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :logo

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
