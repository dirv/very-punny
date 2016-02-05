require 'rspec'
require 'very_punny'

describe :generate do
  RHYMES = { "skim" => ["swim", "slim", "him", "dim", "grim", "limb", "rim", "hymn", "trim", "brim", "gym", "whim", "prim", "sim"]}

  it "returns a pun" do
    phrases =  [ "go out on a limb", "grim reaper", "fatboy slim" ]
    generator = Generator.new(RHYMES, phrases)
    expect(generator.generate("skim")).to eq(["fatboy skim", "go out on a skim", "skim reaper"])
  end

  it 'capitalizes' do
    phrases =  [ "Grim reaper" , "grim reaper"]
    generator = Generator.new(RHYMES, phrases)
    expect(generator.generate("skim")).to eq(["Skim reaper", "skim reaper"])
  end

  it 'refuses bad english words' do
    phrases =  [ "Grim reaper" , "grim reaper"]
    generator = Generator.new(RHYMES, phrases)
    expect{generator.generate("924blkasdgf8")}.to raise_error("Unknown word")
  end

end

