require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "returns the weapon name, level and current power." do
    weapon = build(:weapon)
    expected_title = "Olá, a arma #{weapon.name} está no level #{weapon.level}, e com o poder de #{weapon.power_base}"
    expect(weapon.title).to eq(expected_title)
    puts "esperado: #{expected_title} \n\ recebido: #{weapon.title}"
  end

  it "calcutates the right current_power for provided level, power_base and power_step" do
     weapon = build(:weapon, power_base: 20, power_step: 10, level: 55)

     expect(weapon.current_power).to eq(560)

     puts "#{weapon.current_power} < poder atual \n\ esperado> 560"
   end
end
