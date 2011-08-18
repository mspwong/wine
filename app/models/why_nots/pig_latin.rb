class PigLatin
  def self.translate(text)
    text.split(" ").collect do |word|
      (word.chars.to_a[1, word.length] << word.chars.first << "ay ").to_s
    end.to_s.strip
  end
end