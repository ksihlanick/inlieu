class AddEnddateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :enddate, :datetime
  end
end
