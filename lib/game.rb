class Game

  attr_reader :players, :current_turn, :opposing_turn

  def initialize(player_1, player_2)
    @players = [ player_1, player_2 ]
    @current_turn = @players.first
    @opposing_turn = @players.last
  end

  def attack
    @opposing_turn.receive_damage
  end

  def switch_turns
    @current_turn = @players.rotate!.first
    @opposing_turn = @players.last
  end

end
