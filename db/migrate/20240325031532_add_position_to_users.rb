class AddPositionToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :position)
      add_column :users, :position, :integer
    end
  end
end