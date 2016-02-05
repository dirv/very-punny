require 'very_punny'

class Program
  RHYMES = { "skim" => ["swim", "slim", "him", "dim", "grim", "limb", "rim", "hymn", "trim", "brim", "gym", "whim", "prim", "sim"]}
  PHRASES =  [ "go out on a limb", "grim reaper", "fatboy slim" ]

  def initialize(input, output)
    @input = input
    @output = output
  end

  def run
    @output.print "Please enter a word: "

    word = @input.gets.chomp
    puns = Generator.new(RHYMES, PHRASES).generate(word)
    puns.each do |pun|
      @output.puts pun
    end
  end
end
