require "rspec"
require_relative "../filter_list"

describe "Basic Tests"do
  it "filters out items that are not in the whitelist" do
    items = [ 1, 2, 3 ]
		whitelist = [ 1, 3 ]
		answer = [ 1, 3]
    expect(filter_list(items, whitelist)).to eq(answer)
  end
end
