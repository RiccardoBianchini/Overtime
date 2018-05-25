Given("I am on the discussions page") do
    visit discussions_path
end

Given("there is at least a discussion") do
    discussion = Discussion.create!(:title => 'Test title', :body => 'Test body')
    expect(discussion).not_to be_nil
end

When("I follow {string}") do |string|
    click_link(string)
end

Then("I should be on the {string}") do |string|
end

When("I fill in {string} with {string}") do |name, value|
    fill_in name, with: value
end

When("I press {string}") do |string|
pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see {string}") do |string|
pending # Write code here that turns the phrase above into concrete actions
end