class AddPowerBaseToWeapon < ActiveRecord::Migration[8.1]
  def change
    add_column :weapons, :power_base, :float
    add_column :weapons, :power_step, :integer
    add_column :weapons, :level, :integer
  end
end
