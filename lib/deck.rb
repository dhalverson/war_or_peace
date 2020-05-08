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
    percent = high_ranking_cards.count.to_f / cards.count.to_f
    percent.round(4) * 100
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    cards.push(new_card)
  end
end
