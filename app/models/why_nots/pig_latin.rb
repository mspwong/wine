class PigLatin
  def self.translate(text)
    text.split(" ").collect do |word|
      chars = word.downcase.gsub(/[^a-z ]/, '').gsub(/ /, '-').chars
      pig_latin_ending = "ay "
      pig_latin_word = (chars.to_a[1, word.length] << chars.first << pig_latin_ending).to_s
      pig_latin_word.capitalize! if word.first == word.first.capitalize
      punctuations = word.chars.to_a[pig_latin_word.length-pig_latin_ending.length, word.length].to_s
      pig_latin_word.chop! << punctuations unless punctuations.blank?
      pig_latin_word
    end.to_s.strip
  end
end