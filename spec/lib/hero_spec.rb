require 'spec_helper'
require 'hero'

describe Hero do 
  context "when an Hero is istantiated" do 
    it 'has a Sword' do
      hero = Hero.new
      expect(hero.weapon).to eql("Sword")
    end

    it 'has more than 1000hp points' do
      hero = Hero.new
      expect(hero.hp).to be > 1000
    end
  end

  context "when an Hero is intantiated with armor" do
    it "has 5000hp" do
      hero = Hero.new(has_armor_on_creation = true)
      expect(hero.hp).to eql(5000)
    end
  end
end