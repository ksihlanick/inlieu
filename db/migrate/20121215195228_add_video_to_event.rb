class AddVideoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :video, :string
  end
end
