class Rhymer

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find(word)
    responses = []
    @dictionary.each do |rhyme|
      if rhyme[-2.. -1] == word[-2..-1] && rhyme != word
        responses << rhyme
      end
    end
    responses
  end
end
