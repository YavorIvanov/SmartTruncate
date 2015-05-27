require 'smart_truncate/railtie' if defined?(Rails)
require 'active_support/core_ext/string'

module SmartTruncate
  
  # sample gem verification
  def self.hi
    return 'hi'
  end
  
  # truncate by characters count
  def self.by_chars(text, char_limit, ending = '.')
    text = text.to_s
    text = text.squish
    size = 0
    new_text = text.mb_chars.split().reject do |token|
      size+=token.size()
      size>char_limit
    end.join(" ")
    if size > char_limit
      return new_text += ending
    else
      return new_text
    end
  end

  def self.by_sentences(text, sentence_limit, ending = '.')
    text = text.to_s
    text = text.squish
    size = 0
    arr = text.mb_chars.split(/(?:\.|\?|\!|\…|\;)(?= [^a-z]|$)/)
    arr = arr[0...sentence_limit]
    new_text = arr.join(".")
    new_text += ending
  end

  def self.by_mixed(text, sentence_limit, char_limit)
    text = self.by_sentences(text, sentence_limit)
    text = self.by_chars(text, char_limit)
  end

end