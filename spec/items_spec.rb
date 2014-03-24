require 'spec_helper'
require 'capybara/rspec'
require_relative '../appy'

Capybara.app = Appy

feature "Manage items" do
  scenario "user can view and add items" do
    visit "/"
    expect(page).to have_title("Food Repository")

    expect(page).to have_content("Submit New Item")

    expect(page).to_not have_content("Mac n' Cheese")

    click_link("Submit New Item")
    fill_in "new_item", with: "Mac n' Cheese"
    click_on("Create Item")
    expect(page).to have_content("Mac n' Cheese")
  end
end