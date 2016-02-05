require 'very_punny'

class Program
  DICTIONARY = ["skim", "jim", "grim", "goose", "slim"]
  PHRASES =  [ "Go out on a limb", "Grim Reaper", "Fatboy Slim" ]

  def initialize(input, output)
    @input = input
    @output = output
  end

  def run
    @output.print "Please enter a word: "

    word = @input.gets.chomp
    puns = Generator.new(DICTIONARY, PHRASES).generate(word)
    puns.each do |pun|
      @output.puts pun
    end
  end
end
