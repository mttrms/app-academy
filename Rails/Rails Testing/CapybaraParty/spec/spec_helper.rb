RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

# shared helper helper methods across specs

def sign_up_capy(name, color)
  visit "/capys/new"
  # save_and_open_page
  fill_in "name", with: name
  fill_in "color", with: color
  click_on "Create Capy"
end
