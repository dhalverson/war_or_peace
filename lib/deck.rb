class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(item)
    cards[item].rank
  end

  def high_ranking_cards
    cards.select { |card| card.rank > 10 }
  end

  def percent_high_ranking
    (high_ranking_cards.count.to_f / cards.count.to_f) * 100
  end
end
  #
  # def remove_card
  #   new_array.shift
  # end



  # class Deck
  #
  #   attr_reader :cards, :new_array
  #   def initialize(cards)
  #     @cards = cards
  #     @new_array = []
  #   end
  #
  #   def rank_of_card_at(item)
  #     cards[item].rank
  #   end
  #
  #   def high_ranking_cards
  #     cards.each do |card|
  #       if card.rank >= 11
  #         new_array << card
  #       end
  #     end
  #   end
  #
  #   def percent_high_ranking
  #     high_ranking_cards.count / deck.cards.count
  #     require "pry"; binding.pry
  #   end
  #
  #   def remove_card
  #     new_array.shift
  #   end
