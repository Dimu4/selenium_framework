# class for Sign in page
class SignIn < PageActions

  # using path to construct url by replacing BASEURL with test/production server
  def path
    "https://reg.USPSCOM/entreg/LoginAction_input"
  end

  def login_field
    @browser.find_element(:id, "userName")
  end

  def password_field
    @browser.find_element(:id, "password")
  end

  # reusing method "login_field"
  def send_login login
    login_field.send_keys login
  end

  # reusing method "send_password"
  def send_password password
    password_field.send_keys password
  end

  def sign_in_button
    @browser.find_element(:id, "sign-in-button")
  end

  # method takes error message as argument and verify that element class is "error", not "error_hide"
  def error_message_visible? error
    case
      when error == "A Username is a required entry."
        @browser.find_element(:id, "error-invalid-username").attribute(:class).should == "error"
      when error == "A password is required."
        @browser.find_element(:id, "error-invalid-password").attribute(:class).should == "error"
      when error == "Your Account has been Locked.  Please use the Forgot Password link to unlock your Password."
        @browser.find_element(:id, "error-three-strikes").attribute(:class).should == "error"
      when error == "Your Username must be at least 6 characters long."
        @browser.find_element(:id, "error-min-username").attribute(:class).should == "error"
      else
        puts "None of error messages are available"
        fail
    end
  end


end