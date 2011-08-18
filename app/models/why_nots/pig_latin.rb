class PigLatin
  def self.translate(text)
    text.split(" ").collect do |word|
      chars = word.chars
      pig_latin_word = (chars.to_a[1, word.length] << chars.first << "ay ").to_s
      pig_latin_word.capitalize if chars.first == chars.first.capitalize
      pig_latin_word
    end.to_s.strip
  end
end