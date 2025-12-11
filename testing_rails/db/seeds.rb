# db/seeds.rb

# Garante que as sementes não são criadas novamente a cada vez
puts "Criando inimigos..."

enemies_to_create = [
  { name: 'Abluésbeb tuésbeb ', level: 2, kind: 0, power_base: 100, power_step: 10 },
  { name: 'Asssssss', level: 2, kind: 0, power_base: 120, power_step: 15 },
  { name: 'Chefe matraca', level: 5, kind: 1, power_base: 500, power_step: 50 } # kind: 1 pode ser um 'boss'
]

enemies_to_create.each do |enemy_attrs|
  Enemy.find_or_create_by!(name: enemy_attrs[:name]) do |enemy|
    enemy.level = enemy_attrs[:level]
    enemy.kind = enemy_attrs[:kind]
    enemy.power_base = enemy_attrs[:power_base]
    enemy.power_step = enemy_attrs[:power_step]
  end
end

puts "Inimigos criados com sucesso!"
