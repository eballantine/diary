def add_test_entry
  visit '/'
  click_button('Add entry')
  fill_in 'title', with: 'Feature: Add Entry Test Title'
  fill_in 'content', with: 'Feature: Add Entry Test Content'
  click_button('Add')
end