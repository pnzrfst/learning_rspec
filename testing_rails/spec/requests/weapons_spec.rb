require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /weapons" do
    it "returns https success" do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "the weapon's title is present" do
      weapons = create_list(:weapon, 3)

      get weapons_path

      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end

    it "returns the weapon name" do
      weapons = FactoryBot.create_list(:weapon, 5)

      get weapons_path

      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end

    it "returns the weapon current_power" do
      weapons = create_list(:weapon, 5)

      get weapons_path

      weapons.each do |weapon|
        expect(response.body).to include(weapon.current_power.to_s)
      end
    end
  end

  describe "POST/weapons" do
    context "when it has valid parameters" do
      it 'creates the weapon correctly' do
        weapon_attributes = FactoryBot.attributes_for(:weapon)

        post weapons_path, params: { weapon: weapon_attributes }

        expect(Weapon.last).to have_attributes(weapon_attributes)
      end
    end

    context "when it has invalid parameters" do
      it "does not create a weapon" do
        expect {
          post weapons_path, params: { weapon: { name: 2, description: 2, level: "teste", power_base: "12321", power_step: "213" } }
        }
      end
    end
  end
end
