# frozen_string_literal: true

feature 'Edit Entry' do
  scenario 'User edits an entry' do
    add_test_entry
    visit('/entries/1')
    expect(page).to have_content 'Edit'
    click_on 'Edit'
    fill_in 'title', with: 'Updated Title'
    fill_in 'content', with: 'Updated Content'
    click_button 'Save'
    expect(page).to have_content 'Updated Title'
    expect(page).to have_content 'Updated Content'
  end
end
