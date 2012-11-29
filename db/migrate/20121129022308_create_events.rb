class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.string :inlieuof
      t.string :charity_name
      t.decimal :money_raised, :precision => 8, :scale => 2
      t.decimal :goal_money, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
