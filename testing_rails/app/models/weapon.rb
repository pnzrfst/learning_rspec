class Weapon < ApplicationRecord
  validates :level, :power_step, :power_base, numericality: { greater_than: 0 }

  def current_power
    power_base + ((level - 1) * power_step)
  end

  def title
    "Olá, a arma #{name} está no level #{level}, e com o poder de #{power_base}"
  end
end
