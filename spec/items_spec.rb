require 'spec_helper'
require 'capybara/rspec'
require_relative '../appy'

Capybara.app = Appy

feature "Manage items" do
  scenario "user can view and add items" do
    visit "/"
    expect(page).to have_content("Submit New Item")
    click_link("Submit New Item")
  end
end