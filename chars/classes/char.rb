require_relative 'power'


class Char 
  include Power 
  attr_reader :life, :name

  def initialize name
    @name = name
    @life = 100
  end

  def performAttack(target)
    base_damage = 20

    damage_dealt = attack(@name, target, base_damage)

    puts "Uau,  o #{@name} atacou o #{target.name} e causou #{damage_dealt} de dano"

    target.receive_damage(base_damage)
  end

  def actualLife(name)
    puts "Eu, #{name} tenho #{@life} de vida."
  end

  def receive_damage(damage)
    @life -= damage
  end
end

