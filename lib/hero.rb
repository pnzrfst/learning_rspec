class Hero
  attr_accessor :weapon, :hp, :hasArmor

  def initialize(has_armor_on_creation = false)
    @weapon = "Sword"

    @hasArmor = has_armor_on_creation

    if @hasArmor == true
      @hp = 5000
    else
      @hp = 1100
    end

  end

  def hasArmor?
    @hasArmor
  end
end