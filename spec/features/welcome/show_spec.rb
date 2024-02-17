require 'rails_helper'

RSpec.describe 'Welcome Page' do 
  describe 'Currency Exchange Search Form' do 
    it 'has a form for searching exchange rates' do 
      visit root_path

      expect(page).to have_content 'Currency Exchange'

      expect(page).to have_content('From')
      expect(page).to have_content('To')
      
      expect(page).to have_select('current_cur', with_options: ['United States Dollar', 'Canadian Dollar', 'Euro', 'Japanese Yen', 'Chinese Yuan', 'British Pound', 'Swiss Franc', 'New Zealand Dollar', 'Australian Dollar', 'South Korean Won', 'Polish Zloty', 'Danish Krone', 'Turkish New Lira', 'Hong Kong Dollar'])
      expect(page).to have_select('desired_cur', with_options: ['United States Dollar', 'Canadian Dollar', 'Euro', 'Japanese Yen', 'Chinese Yuan', 'British Pound', 'Swiss Franc', 'New Zealand Dollar', 'Australian Dollar', 'South Korean Won', 'Polish Zloty', 'Danish Krone', 'Turkish New Lira', 'Hong Kong Dollar'])

      expect(page).to have_button 'Submit'
    end

    it 'Returns foreign currency exchange rates', :vcr do
      visit root_path 

      select 'United States Dollar', from: :current_cur 
      select 'Japanese Yen', from: :desired_cur 

      click_button 'Submit'
      expect(current_path).to eq '/currency'
      save_and_open_page
    end 
  end
end