class AddDefaultValueToLevel < ActiveRecord::Migration[8.1]
  def change
    change_column_default :weapons, :level, 1
  end
end
