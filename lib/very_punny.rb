require 'httparty'
require 'rhymer'
require 'csv'

class Generator

  def initialize(dictionary, phrases, dvd_list_path)
    @dictionary = dictionary
    @rhymer = Rhymer.new(dictionary)
    @phrases = phrases

    CSV.foreach(dvd_list_path) do |row|
      @phrases << row[0]
    end
  end

  def generate(word)
    raise "Unknown word" unless @dictionary.include?(word.downcase)
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

