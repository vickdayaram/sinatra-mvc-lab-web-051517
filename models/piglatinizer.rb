
class PigLatinizer

  def piglatinize(word)
    alpha = ('a'..'z').to_a
    vowels = %w[a e i o u]
    consonants = alpha - vowels

    if vowels.include?(word[0..0].downcase)
    word + 'way'
    elsif consonants.include?(word[0..0].downcase) && consonants.include?(word[1..1].downcase) && consonants.include?(word[2..2])
      word[3..-1] + word[0..2] + 'ay'
    elsif consonants.include?(word[0..0].downcase) && consonants.include?(word[1..1].downcase)
      word[2..-1] + word[0..1] + 'ay'
    elsif word[0..1].downcase == "qu"
      word[2..word.length]+"quay"
    elsif word[0..2].downcase == "squ"
       word[3..word.length]+"squay"
    else consonants.include?(word[0].downcase)
      word[1..-1] + word[0..0] + 'ay'
    end
  end

  def to_pig_latin(sentence)
    words_array = sentence.split(" ")
    latin_array = []
    i = 0
    while i < words_array.length do
     latin_array.push(self.piglatinize(words_array[i]))
     i += 1
    end
    latin_array.join(" ")
  end
end
