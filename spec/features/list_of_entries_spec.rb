# frozen_string_literal: true

feature 'List of Entries' do
  scenario 'user on homepage, views entries' do
    visit '/'
    click_button('Entries')
    expect(page).to have_content 'All Diary Entries'
    expect(page).to have_button 'Home'
  end
end
