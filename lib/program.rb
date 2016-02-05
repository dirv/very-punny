require 'very_punny' 
class Program 
  DICTIONARY = ["skim", "jim", "grim", "goose", "slim"]
  PHRASES =  [ "Go out on a limb", "Grim Reaper", "Fatboy Slim", "Carlos Slim", "Gym Class Heroes", "Grim Fandango", "Slim Jim", "Soulja Slim", "Sim City"] 
  DVD_LIST_PATH = "1001_movie_list.csv"

  def initialize(input, output)
    @input = input
    @output = output
  end

  def run
    @output.print "Please enter a word: "

    @dictionary = File.open('/usr/share/dict/words', 'r').readlines.map(&:strip).map(&:downcase)
    word = @input.gets.chomp
    puns = Generator.new(@dictionary, PHRASES, DVD_LIST_PATH).generate(word)
    puns.each do |pun|
      @output.puts pun
    end
  end
end
