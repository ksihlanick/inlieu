class AddRejectedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :rejected, :boolean
  end
end
