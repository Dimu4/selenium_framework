require "selenium-webdriver"
require "rspec"
#require "debugger"
require "json"

require File.join(File.dirname(__FILE__), "page_actions.rb")



# setting browser as a parameter, default browser is Firefox
# to run tests against Chrome/Safari browser you have to add additional parameter in terminal BROWSER=chrome (Mac users)
# example: cucumber -p signin BROWSER=chrome
browser = (ENV['BROWSER'] || :firefox).to_sym
$desktop_browser = Selenium::WebDriver.for browser

# creating a hash to build url (for example: run your test against Production server or Test server)
# to run tests against Production/Test environment you have to add additional parameter in terminal ENVIRONMENT=production (Mac users)
# NOTE: test server added as a example (you can reuse this code to test your company web site on internal test servers)
SERVER_LABELS = {:production => "usps.com", :test => "test_server01.usps.com"}

# get ENVIRONMENT variable from terminal
def get_env
  env = (ENV['ENVIRONMENT'] || :production).to_sym
  SERVER_LABELS[env]
end

# read data from users.json file
# parse file using JSON gem
def get_user_info user
  file = File.open("features/support/users.json", "r")
  json = file.read
  parsed = JSON.parse(json)
  return parsed[user]["login"],parsed[user]["password"]
end

# creating object of USPS class
def usps
  Usps.new $desktop_browser
end

# do something before each scenario
Before do

end

# do something after each scenario
After do

end


def take_screenshot file_name
  $desktop_browser.save_screenshot "features/screenshots/#{file_name}"
end

# if scenario failed, create unique file_name and attach screenshot to report.html file
After do |scenario|
  if scenario.failed?
    file_name = Time.now.strftime("%Y-%m-%d-%H:%M:%S.png").to_s
    take_screenshot file_name
    embed("features/screenshots/#{file_name}", 'image/png')
  end
end

#another cucumber hook that enable you to perform final cleanup
# after all scenarios have executed
at_exit do
  $desktop_browser.quit
end


