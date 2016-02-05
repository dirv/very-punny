require 'rspec'
require 'very_punny'

describe :generate do
  DICTIONARY = [ "skim", "jim", "grim", "goose" , "slim"]

  it "returns a pun" do
    phrases =  [ "grim reaper", "fatboy slim" ]
    generator = Generator.new(DICTIONARY, phrases)
    expect(generator.generate("skim")).to eq(["fatboy skim", "skim reaper"])
  end

  it 'capitalizes' do
    phrases =  [ "Grim reaper" , "grim reaper"]
    generator = Generator.new(DICTIONARY, phrases)
    expect(generator.generate("skim")).to eq(["Skim reaper", "skim reaper"])
  end

  it 'refuses bad english words' do
    phrases =  [ "Grim reaper" , "grim reaper"]
    generator = Generator.new(DICTIONARY, phrases)
    expect{generator.generate("924blkasdgf8")}.to raise_error("Unknown word")
  end

end

