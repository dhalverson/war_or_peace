require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new("Clarisa", @deck)
  end

  def test_it_exists

    assert_instance_of @player, @player.name
    assert_instance_of @deck, @player.deck
  end

  def test_it_has_lost

    refute @player.has_lost?
    @player.deck.remove_card
    refute @player.has_lost?
    @player.deck.remove_card
    refute @player.has_lost?
    @player.deck.remove_card
    assert @player.has_lost?
  end

end
