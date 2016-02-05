require 'httparty'

class Generator

  def initialize(rhymes, phrases)
    @rhymes = rhymes
    @phrases = phrases
  end

  def generate(word)
    @rhymes[word].map do |rhyme|
      @phrases.select do |phrase|
        words = phrase.downcase.split(' ')
        words.include?(rhyme.downcase)
      end.map do |phrase|
        phrase.gsub(rhyme, word).gsub(rhyme.capitalize, word.capitalize)
      end
    end.flatten.compact.sort
  end
end

