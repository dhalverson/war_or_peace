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
    @card5 = Card.new(:heart, '8', 8)
    @card8 = Card.new(:diamond, '2', 2)

    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)

    @madcard = Card.new(:diamond, '8', 8)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)

  end

  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_it_starts_with_empty_array

    assert_equal [], @turn.spoils_of_war
  end

  def test_it_has_a_turn_type_of_basic
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_it_has_a_turn_type_of_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_has_a_turn_type_of_mad
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @madcard, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_if_it_equals_basic_winner_is_player_with_higher_rank_card_at_0
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_it_equals_war_winner_is_player_with_higher_rank_card_at_2
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_it_equals_no_winner_when_mad
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @madcard, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_it_sends_one_card_per_player_to_spoils_pile_if_basic

    assert_equal [@card1, @card3], @turn.pile_cards
  end

  def test_it_sends_three_cards_per_player_to_spoils_pile_if_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal [@card1, @card4, @card2, @card3, @card5, @card6], turn.pile_cards
  end

  def test_it_discards_three_cards_per_player_if_mad
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @madcard, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal [], turn.pile_cards
  end

  def test_it_adds_cards_in_spoils_to_winner
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards
    turn.award_spoils(turn.winner)

    assert_equal [@card1, @card3], turn.spoils_of_war
    assert_equal [@card1, @card2, @card5, @card8, @card4], @player2.deck
  end
end
