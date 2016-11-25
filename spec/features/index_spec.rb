require 'spec_helper'

feature Battle do

  before(:each) do
    sign_in_and_play
  end

  context 'enter names' do
    scenario 'tests that filling in the player_1 and player_2 form returns the names' do
      expect(page).to have_content('Clinton vs Trump')
    end
  end

  context 'hitpoints' do
    scenario 'checks player 2\'s hitpoints' do
      expect(page).to have_content('Hitpoints: 30')
    end

    scenario 'returns the confirmation when Hit button gets clicked on' do
      click_button('Hit')
      expect(page).to have_content('Clinton attacked Trump')
    end
  end

  context 'turns' do
    scenario 'should show whose turn it is' do
      expect(page).to have_content('Clinton\'s turn')
    end
  end
end
