class Game

  attr_reader :players, :current_turn, :opposing_turn

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

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

  def lost?
    @opposing_turn.hp == 0
  end

end
