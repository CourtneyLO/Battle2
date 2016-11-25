require 'game.rb'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double(:player)}
  let(:player_2) { double(:player)}

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
      expect((game.players).last).to receive(:receive_damage)
      game.attack(game.players.last)
    end

  end

end
