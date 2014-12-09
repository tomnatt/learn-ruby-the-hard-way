class Lexicon
  @directions = ['north', 'south', 'east', 'west', 'down', 'up', 'left', 'right', 'back']
  @verbs = ['go', 'stop', 'kill', 'eat']
  @stops = ['the', 'in', 'of', 'from', 'at', 'it']
  @nouns = ['door', 'bear', 'princess', 'cabinet']

  def Lexicon.scan(input)
    results = []
    words = input.split

    # for each input word, check the lexicon and build a response
    words.each do |word|
      if @directions.include?(word)
        results << ['direction', word]
      elsif @verbs.include?(word)
        results << ['verb', word]
      elsif @stops.include?(word)
        results << ['stop', word]
      elsif @nouns.include?(word)
        results << ['noun', word]
      elsif word.match(/^\d+$/)
        results << ['number', word.to_i]
      else
        results << ['error', word]
      end
    end
    return results
  end
end