class Usps < PageActions

  def find_zip_code_page
     FindZipCodePage.new @browser
  end

  def home_page
    HomePage.new @browser
  end

  def signin_page
    SignIn.new @browser
  end


end