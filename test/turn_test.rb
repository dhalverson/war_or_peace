require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @madcard6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @maddeck1 = Deck.new([@card1, @card2, @card5, @card8])
    @maddeck2 = Deck.new([@card4, @card3, @madcard6, @card7])
    @wardeck1 = Deck.new([@card1, @card2, @card5, @card8])
    @wardeck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @madplayer1 = Player.new("Megan", @maddeck1)
    @madplayer2 = Player.new("Aurora", @maddeck2)
    @warplayer1 = Player.new("Megan", @wardeck1)
    @warplayer2 = Player.new("Aurora", @wardeck2)
    @turn = Turn.new(@player1, @player2)
    @madturn = Turn.new(@madplayer1, @madplayer2)
    @warturn = Turn.new(@warplayer1, @warplayer2)
  end

  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_it_starts_with_empty_array

    assert_equal [], @turn.spoils_of_war
  end

  def test_it_has_a_turn_type_of_basic

    assert_equal :basic, @turn.type
  end

  def test_it_has_a_turn_type_of_war

    assert_equal :war, @warturn.type
  end

    def test_it_has_a_turn_type_of_mad

    assert_equal :mutually_assured_destruction, @madturn.type
  end
end
