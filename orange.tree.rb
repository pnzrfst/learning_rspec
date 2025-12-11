class OrangeTree 
  
  def initialize (height)
    @height = height
    @years_old = 0
    @oranges_quantity = 0

  end

  def return_height 
    return puts "A arvore tem " + "" + @height.to_s + "m"
  end

  def get_age
    return @years_old.to_s
  end

  def turn_year 
    @years_old += 1

    if @oranges_quantity > 0 
      @oranges_quantity = 0
      puts "Infelizmente, ao deixar laranjas na arvore, as laranjas restantes cairam."
    end
  end

  def give_fruit
    if(@years_old < 5)
      puts "Não pode gerar frutos."
    end

    @oranges_quantity += 5

    puts "Eba, temos " + "" + @oranges_quantity.to_s + "" + " laranjas na nossa arvore."

  end

  def count_oranges
    puts "Existem " + "" + @oranges_quantity.to_s + "" + " laranjas" + "" + " na arvore."
  end


  def take_an_orange
    @oranges_quantity = @oranges_quantity - 1
    puts "Voce pegou uma laranja, agora existem " + @oranges_quantity.to_s + " na arvore"
  end
end




puts "Plantando.."
minha_arv = OrangeTree.new("1.9");

minha_arv.return_height 

minha_arv.count_oranges

puts "Nossa arvore tem " + "" + minha_arv.get_age + "" + " anos"

5.times do
  puts "Passando um ano, atençao!"
  minha_arv.turn_year
end

puts "Nossa arvore tem" + "" + minha_arv.get_age + "" + "anos"

5.times do
  minha_arv.give_fruit
end

minha_arv.count_oranges

minha_arv.take_an_orange