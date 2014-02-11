class PageActions

  # common method to initialize browser
  def initialize browser
    @browser = browser
  end

  # constructing url
  def build_url
    env = get_env
    url = self.path.gsub!("BASEURL", env)
  end

  def visit
    url = build_url
    @browser.navigate.to url
  end

end