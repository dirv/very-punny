require 'program'

describe :run do
  it "says hello" do
    input = StringIO.new("skim\n")
    output = StringIO.new
    Program.new(input, output).run
    expect(output.string).to include("Please enter a word: ")
  end

  it "will output some puns based on a given word" do
    input = StringIO.new("skim\n")
    output = StringIO.new
    Program.new(input, output).run
    expect(output.string).to include("Skim Reaper")
  end
end
