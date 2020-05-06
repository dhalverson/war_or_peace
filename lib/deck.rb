class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end
end


# # ranks [2..10 j q k a]
# # suits ["clubs", "diamonds", "hearts", "spades"]
# # use .each do to create a whole deck of cards off the numbers and suits
# # Deck.new   cards.each do |card| "card_rank card_suit"
#   def cards
#
#
#   def rank_of_card
#      # arr[0] => return the value of the card
#   end
#
#   def high_ranking_cards
#     # if cards are >= 11
#   end
#
#   def percent_high_ranking
#     # high ranking cards / total number of cards or 52?
#   end
#
#   def remove_card
#     # shift, remove first in array
#   end
#
#   def add_card
#     #push, add item to end of array and return the entire new array
#   end
#
#
#
# end
