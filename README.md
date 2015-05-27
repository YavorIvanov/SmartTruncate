# SmartTruncate

smart_truncate is a simple Rails gem that truncates text like a human.
Ever wanted to truncate some text till the Ntn character only to find a word or sentence was cut in half? SmartTruncate fixes that."

## INSTALL

``` ruby
gem install smart_truncate
```

## BASIC smart_truncate USE

``` ruby
# truncate by characters and it will end in a meaningful word
SmartTruncate.by_chars("I am a nice sentance… Previous sentence is not with a proper multicolon ending.",26,'!')
# => "I am a nice sentance… Previous!"

# truncate by sentence
SmartTruncate.by_sentences("I am a nice sentance ... Previous sentence is not with a proper multicolon ending.",1)
# => "I am a nice sentance ..."

# truncate mixed by both sentence and characters/words
SmartTruncate.by_mixed("I am a nice sentance. Previous sentence is with a proper multicolon ending.",2,10)
# => "I am a nice."
SmartTruncate.by_mixed("I am a nice sentance. Previous sentence is with a proper multicolon ending.",1,100)
# => "I am a nice sentance."
```

## LICENSE

This project uses MIT-LICENSE.
