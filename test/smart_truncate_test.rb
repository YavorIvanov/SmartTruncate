require 'minitest/autorun'
#require 'active_support'
require 'smart_truncate'

class SmartTruncateTest < Minitest::Test
  
  def test_hi
    assert_equal "hi",
      SmartTruncate.hi
  end
  
  def test_by_chars
    #I am a nice sentance. Previous sentence is not with a proper multicolon ending.
    assert_equal "I am a nice",
      SmartTruncate.by_chars("I am a nice sentance. Previous sentence is not with a proper multicolon ending.",15,'')
    assert_equal "I am a nice sentance.",
      SmartTruncate.by_chars("I am a nice sentance. Previous sentence is not with a proper multicolon ending.",17,'')
    assert_equal "I am a nice sentance. Previous",
      SmartTruncate.by_chars("I am a nice sentance. Previous sentence is not with a proper multicolon ending.",26,'')
    # I am a nice sentance… Previous sentence is with a proper multicolon ending.
    assert_equal "I am a nice sentance… Previous",
      SmartTruncate.by_chars("I am a nice sentance… Previous sentence is not with a proper multicolon ending.",26,'')
    # I am a nice sentance!!! That's all she wrote.
    assert_equal "I am a nice sentance!!!",
      SmartTruncate.by_chars("I am a nice sentance!!! Previous sentence is not with a proper multicolon ending.",26,'')
    assert_equal "I am a nice sentance!!! Previous",
      SmartTruncate.by_chars("I am a nice sentance!!! Previous sentence is not with a proper multicolon ending.",29,'')
    # I am not a нице $ sËntance # mix1ng < all / kinds of things.
    assert_equal "I am not a нице $ sËntance # mix1ng < all / kinds",
      SmartTruncate.by_chars("I am not a нице $ sËntance # mix1ng < all / kinds of things.",37,'')
    assert_equal "I am not a нице $ sËntance # mix1ng < all / kinds",
      SmartTruncate.by_chars("I am not a нице $ sËntance # mix1ng < all / kinds of things.",38,'')
  end
  
  def test_by_sentences
    # I am a nice sentance ... Previous sentence is not with a proper multicolon ending.
    assert_equal "I am a nice sentance ...",
      SmartTruncate.by_sentences("I am a nice sentance ... Previous sentence is not with a proper multicolon ending.",1)
    assert_equal "I am a nice sentance ... Previous sentence is not with a proper multicolon ending.",
      SmartTruncate.by_sentences("I am a nice sentance ... Previous sentence is not with a proper multicolon ending.",2)
    # I am a nice sentance… Previous sentence is with a proper multicolon ending.
    assert_equal "I am a nice sentance.",
      SmartTruncate.by_sentences("I am a nice sentance… Previous sentence is with a proper multicolon ending.",1,'.')
    assert_equal "I am a nice sentance. Previous sentence is with a proper multicolon ending.",
      SmartTruncate.by_sentences("I am a nice sentance… Previous sentence is with a proper multicolon ending.",2,'.')
    # I am a nice sentence; That's all she wrote;
    assert_equal "I am a nice sentence.",
      SmartTruncate.by_sentences("I am a nice sentence; That's all she wrote;",1,'.')
    assert_equal "I am a nice sentence. That's all she wrote.",
      SmartTruncate.by_sentences("I am a nice sentence; That's all she wrote;",2,'.')
    # I am a nice sentence, That's all she wrote.
    assert_equal "I am a nice sentence, That's all she wrote.",
      SmartTruncate.by_sentences("I am a nice sentence, That's all she wrote.",1,'.')
    assert_equal "I am a nice sentence, That's all she wrote.",
      SmartTruncate.by_sentences("I am a nice sentence, That's all she wrote.",2,'.')
    # I am a nice sentence!!! That's all she wrote.
    assert_equal "I am a nice sentence!!!",
      SmartTruncate.by_sentences("I am a nice sentence!!! That's all she wrote.",1,'!')
    # I am not a nice. $ sentence # mixing < all / kinds of things.
    assert_equal "I am not a nice.",
      SmartTruncate.by_sentences("I am not a nice. $ sentence # mixing < all / kinds of things.",1,'.')
  end
  
  def test_by_mixed
    # I am a nice sentance. Previous sentence is with a proper multicolon ending.
    assert_equal "I am a nice.",
      SmartTruncate.by_mixed("I am a nice sentance. Previous sentence is with a proper multicolon ending.",2,10)
    assert_equal "I am a nice sentance.",
      SmartTruncate.by_mixed("I am a nice sentance. Previous sentence is with a proper multicolon ending.",1,100)
  end
  
end



