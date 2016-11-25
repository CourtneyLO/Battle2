require_relative 'game'

class Player

STARTING_HP = 30
DAMAGE_VALUE = 10

attr_reader :name,:hp

  def initialize(name, hp = STARTING_HP)
    @name = name
    @hp = hp
  end

  def receive_damage
    @hp -= DAMAGE_VALUE
  end

end
