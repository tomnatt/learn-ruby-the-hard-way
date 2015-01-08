require 'ex48/parser.rb'
require "minitest/autorun"

class TestParser < Minitest::Test

  def test_parse_sentence()
    x = parse_sentence([['verb', 'run'], ['direction', 'north']])
    assert_equal(x.subject, 'player')
    assert_equal(x.verb, 'run')
    assert_equal(x.object, 'north')
  end

  def test_parse_bad_sentence()
    assert_raises(ParserError) do
      parse_sentence([['subject', 'man'], ['direction', 'disco'], ['verb', 'dance']])
    end
  end

end