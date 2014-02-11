# class for Find Zip Code page
class FindZipCodePage < PageActions

  # using path to construct url by replacing BASEURL with test/production server
  def path
    "https://tools.BASEURL/go/ZipLookupAction!input.action"
  end

  # find element using css
  def select_state_dropdown
    @browser.find_element(:css, "span.select-current-text")
  end

  # find all elements with tag "li" under parent element with css "ul.select-ul"
  # elements will be stored in array
  def available_states_list
    @browser.find_element(:css, "ul.select-ul").find_elements(:tag_name, "li")
  end

  # printing in terminal states in dropdown menu
  # reusing methods "select_state_dropdown" and "available_states_list"
  def print_available_states
    select_state_dropdown.click
    available_states_list.each do |element|
      puts element.text
    end
  end

  # reusing methods "select_state_dropdown" and "available_states_list"
  # select state by click on element with tag "a"
  def select_state state_name
    select_state_dropdown.click
    available_states_list.each do |element|
      if element.text == state_name
        element.find_element(:tag_name, "a").click
        break
      end
    end
  end

  # find element by name
  def street_address_field street
    @browser.find_element(:name, "tAddress").send_keys street
  end

  # find element by xpath using parent element id
  def suite_field suite
    @browser.find_element(:xpath, "//div[@id='input-block']/div[2]/span/input").send_keys suite
  end

  #find by id
  def city_field city
    @browser.find_element(:id, "tCity").send_keys city
  end

  def find_button
    @browser.find_element(:id, "lookupZipFindBtn").click
  end

  def zip_code
    @browser.find_element(:css, "span.zip").text
  end


end