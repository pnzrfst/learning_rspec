
require_relative './char'

class Warrior < Char
  

  def initialize(name)
    super(name)
    @weapon = "Sword"
    @weapon_base_damage = 30
  end

  class << self
    attr_reader :weapon, :weapon_base_damage, :name, :life
  end

  def performAttack(target)
    base_damage = @weapon_base_damage

    damage_dealt = attack(@name, target, base_damage)
    puts "Uau,  o #{@name} atacou o #{target.name} e causou #{damage_dealt} de dano"

    target.receive_damage(damage_dealt)

    if target.life <= 10
      puts "Ok, eu me rendo."
    end
  end

  def receive_damage
    super
  end

  def actualLife(name)
    super
  end
end




warrior = Warrior.new("Cleitinho")

puts "------------------------------"


villain = Char.new("Vilao")

puts "------------------------------"


warrior.performAttack(villain)

warrior.performAttack(villain)

warrior.performAttack(villain)

puts "------------------------------"

villain.actualLife(villain.name)


puts "------------------------------"
puts warrior.name
warrior.actualLife(warrior.name)