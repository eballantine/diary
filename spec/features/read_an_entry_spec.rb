# frozen_string_literal: true

feature 'Read an Entry' do
  scenario 'user opens an entry to read' do
    add_test_entry
    visit('/entries')
    click_on('Add Entry Test Title')
    expect(page).to have_content('Add Entry Test Content')
  end
end
