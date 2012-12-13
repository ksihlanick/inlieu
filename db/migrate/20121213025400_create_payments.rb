class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.string :email
      t.integer :money_raised
      
      t.timestamps
    end
  end
end
