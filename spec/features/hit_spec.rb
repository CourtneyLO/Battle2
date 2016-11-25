require 'spec_helper'

feature 'Hit' do

  before(:each) do
    sign_in_and_play
  end

  context 'attacking' do

    scenario 'should show player 2\'s HP is reduced by 10 ' do
      click_button('Hit')
      expect(page).to have_content('who now has 20 HP')
    end
  end

  context 'lose game' do

    scenario 'should display losing method when player HP is zero' do
      click_button("Hit")
      click_button("Next turn")
      click_button("Hit")
      click_button("Next turn")
      click_button("Hit")
      click_button("Next turn")
      click_button("Hit")
      click_button("Next turn")
      click_button("Hit")
      expect(page).to have_content("TRUMP YOU ARE FIRED")
    end
  end
end
