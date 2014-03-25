require 'spec_helper'
require 'capybara/rspec'
require_relative '../appy'

Capybara.app = Appy

feature "Manage items" do
  scenario "user can view and add items" do
    visit "/"
    expect(page).to have_title("Food Repository")

    expect(page).to have_content("Submit New Item")

    click_link("Submit New Item")
    fill_in "new_item", with: "Mac n' Cheese"
    click_on("Create Item")
    expect(page).to have_content("Mac n' Cheese")

    click_link("Show Item")
    within ("h1") do
      expect(page).to have_content("Mac n' Cheese")
    end
  end

  scenario "user can edit items" do
    visit "/"
    click_link("Submit New Item")
    fill_in "new_item", with: "Mac n' Cheese"
    click_on("Create Item")

    visit "/item/0"

    click_link("Edit Item")

    within ("h1") do
      expect(page).to have_content "Mac n' Cheese"
    end

    fill_in "submit_edit", with: "Hush Puppies"
    click_on("Edit Item")

    expect(page).to have_content "Hush Puppies"

    visit "/item/0"

    click_on "Delete Item"
    expect(page).to_not have_content "Hush Puppies"
  end
end