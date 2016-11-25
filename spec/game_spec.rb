require 'game.rb'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double(:player1)}
  let(:player_2) { double(:player2)}

  context '.player' do
    it 'test that player one is called' do
      expect((game.players).first).to eq player_1
    end

    it 'test that player two is called' do
      expect((game.players).last).to eq player_2
    end
  end


  context '.attack' do

    it "test that player 2 is being attacked" do
      expect(game.opposing_turn).to receive(:receive_damage)
      game.attack
    end

  end

  context 'switch turns' do

    it "tests that the players switch turns" do
      allow(game.opposing_turn).to receive(:receive_damage)
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end

end
