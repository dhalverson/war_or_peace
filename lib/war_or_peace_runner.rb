
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

  def initialize(suit, value, rank)
    @suits = [:diamond, :club, :heart, :spade]
    @values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
    @ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    @cards = []

    @suits.each do |suit|
      @values.each do |value|
        @ranks.each do |rank|
        end
      end
    end
    @cards
  end

        @cards << Card.new(suit, value, rank)
  end
# cards[0..25]
# cards = [
#   Card.new(:heart, 14, 5)
# ]
#
# deck1 =
# deck2
#
# player1 = Player.new("John", deck1)
#
# start = gets.chomp
# puts "Welcome to War! (or Peace) This game will be played with 52 cards."
