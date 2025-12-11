class Drake 
   def initialize name, type
     @name = name
     @type = type
     @sleeping = true
     @areYouHunger = false
     @manyFoodStomach = 10
     @manyFoodIntestine = 0
     @isHappy = true 

     puts "O ovo se mexe e: " + @name + " nasce."
   end

   def toFeed 
    puts "Voce decidiu alimentar o " + @name + " ."
    @manyFoodStomach = 10
    @isHappy = true
    turnTime
   end

  def takeToGarden
    puts "Voce decidiu levar o " + @name + " para o jardim, e ele se alivia."
    @manyFoodIntestine = 0
    @isHappy = true
    turnTime
  end

  def goToSleep
    puts "Voce decidiu colocar o " + @name + " na cama...."
    @sleeping = true
    @isHappy = true


    3.times do 
      if @sleeping
        turnTime
      end

      if @sleeping
        puts "O " + @name + " está roncando.." 
      end
    end
    
    if @sleeping
      @sleeping = false
      puts "O " + @name + " acordou!!"
    end
  end

  def playWith 
    puts "Voce decide brincar com o " + @name
    puts "Ele dá uma risada sincera .... "
    @isHappy = true

    turnTime 
  end

  def sweetShake
    puts "Voce decide balancar o " + @name + " gentilmente"
    @sleeping = true
    puts "Ele comeca a se sentir sonolento, e cochila no seu braco "
    turnTime

    if @sleeping
      @sleeping = false
      puts "Mas acorda quando voce para.. "
    end
  end


  private
  
  def hungry?
    @manyFoodStomach <= 2
  end

  def hasToGoOutside
    @manyFoodIntestine >= 8
  end

  def turnTime
    if @manyFoodStomach > 0
      @manyFoodStomach = @manyFoodStomach  - 1
      @manyFoodIntestine = @manyFoodIntestine + 1 
    else
      if @sleeping
        @sleeping = false
        puts "Nosso dragao esta acordando!! "
      end

      puts @name + " está faminto, em desespero ele te devorouuu!!"
      exit

    end

    if @manyFoodIntestine >= 10
      @manyFoodIntestine = 0

      puts "Ops, por estar cheio de mais o " + @name + " vomitou em voce!"
    end

    if hungry?
      if @sleeping
        @sleeping = false
        puts "O dragao esta acordando "
      end

      puts " Alimente nosso dragao."
    end

    if hasToGoOutside
      if @sleeping
        @sleeping = false
        puts "Ele esta acordando.... "
      end

      puts "O " + @name + " esta acordado e precisa ir la fora! "
    end
  end

end


pet = Drake.new('luiz', 'ice')

pet.toFeed

pet.playWith

pet.takeToGarden

pet.goToSleep

pet.sweetShake

pet.goToSleep

pet.goToSleep

pet.goToSleep

pet.goToSleep