Given(/^I open a browser with url "(.*?)"$/) do |url|
  $desktop_browser.navigate.to url
end

Given(/^I open an find a zip code page$/) do
  usps.find_zip_code_page.visit
end

And(/^I will print in terminal available states$/) do
  usps.find_zip_code_page.print_available_states
end

And (/^I will select "(.*?)" state$/) do |state_name|
  usps.find_zip_code_page.select_state state_name
end

When(/^I type "(.*?)" as street address$/) do |street_address_name|
  usps.find_zip_code_page.street_address_field street_address_name
end

When(/^I type "(.*?)" as city$/) do |city|
  usps.find_zip_code_page.city_field city
end

When(/^click Find button$/) do
  usps.find_zip_code_page.find_button
end

Then(/^I will get my zip code$/) do
  puts usps.find_zip_code_page.zip_code
end

Then (/^I should get my zip code "(.*?)"$/) do |zip_code|
  usps.find_zip_code_page.zip_code.should == zip_code
end
