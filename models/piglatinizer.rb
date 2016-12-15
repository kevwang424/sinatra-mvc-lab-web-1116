class PigLatinizer

  def piglatinize(word)
    first_letter = word.chars.first
    second_letter = word.chars[1]
    third_letter = word.chars[2]

    if vowel?(first_letter)
      word + "way"
    elsif !vowel?(second_letter) && !vowel?(third_letter)
      word = word.chars[3..-1]
      word.push(first_letter)
      word.push(second_letter)
      word.push(third_letter)
      word.join + "ay"
    elsif !vowel?(second_letter)
      word = word.chars[2..-1]
      word.push(first_letter)
      word.push(second_letter)
      word.join + "ay"
    else
      word.chars[1..-1].push(first_letter).join + "ay"
    end

  end

  def vowel?(letter)
    vowels = %w(a e i o u A E I O U)
    vowels.include?(letter)
  end

  # it 'has a method splits the sentence to piglatinize each word' do
  #   expect(words.to_pig_latin("i love programming")).to eq("iway ovelay ogrammingpray")
  # end

  def to_pig_latin(str)
    str.split(" ").collect do |word|
      piglatinize(word)
    end.join(" ")
  end

end

# "pig" → "igpay"
# "banana" → "ananabay"
# "trash" → "ashtray"
# "happy" → "appyhay"
# "duck" → "uckday"
# "glove" → "oveglay"
# "latin" → "atinlay"
# For words that begin with vowel sounds, one just adds "way" to the end. Examples are:
#
# "eat" → "eatway"
# "omelet" → "omeletway"
# "are" → "areway"
