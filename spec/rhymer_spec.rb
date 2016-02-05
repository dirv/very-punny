require "rhymer"
require "rspec"

RSpec.describe :find do

  it "skim rhymes with jim" do
    dictionary = ["jim", "skim", "goose"]
    words = Rhymer.new(dictionary).find("skim")
    expect(words).to eq(["jim"])
  end


end
