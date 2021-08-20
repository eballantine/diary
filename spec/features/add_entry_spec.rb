# frozen_string_literal: true

feature 'Add Entry' do
  scenario 'user on homepage, adds an entry' do
    add_test_entry
    visit('/entries')
    expect(page).to have_content 'Add Entry Test Title'
  end
end
