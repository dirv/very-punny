require 'httparty'
require 'rhymer'

class Generator

  def initialize(dictionary, phrases)
    @dictionary = dictionary
    @rhymer = Rhymer.new(dictionary)
    @phrases = phrases
  end

  def generate(word)
    raise "Unknown word" unless @dictionary.include?(word)
    @rhymer.find(word).map do |rhyme|
      @phrases.select do |phrase|
        words = phrase.downcase.split(' ')
        words.include?(rhyme.downcase)
      end.map do |phrase|
        phrase.gsub(rhyme, word).gsub(rhyme.capitalize, word.capitalize)
      end
    end.flatten.compact.sort
  end
end

