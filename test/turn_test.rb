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
    @basicplayer1 = Player.new("Megan", @deck1)
    @basicplayer2 = Player.new("Aurora", @deck2)
    @madplayer1 = Player.new("Megan", @maddeck1)
    @madplayer2 = Player.new("Aurora", @maddeck2)
    @warplayer1 = Player.new("Megan", @wardeck1)
    @warplayer2 = Player.new("Aurora", @wardeck2)
    @turn = Turn.new(@basicplayer1, @basicplayer2)
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

  def test_if_it_equals_basic_winner_is_player_with_higher_rank_card_at_0

    assert_equal @basicplayer1, @turn.winner
  end

  def test_it_sends_one_card_to_spoils_pile_if_basic

    assert_equal [@card1, @card3], @turn.pile_cards
  end
# test that checks three cards if war
#test that checks three cards if mad

  def test_if_it_equals_war_winner_is_player_with_higher_rank_card_at_2

    assert_equal @warplayer2, @warturn.winner
  end

  def test_if_it_equals_mad_if_both_players_cards_at_rank_0_and_2_are_the_same


  end

end
