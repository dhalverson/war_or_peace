class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @players = [player1, player2]
  end

  def top_cards_equal?
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def third_cards_equal?
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end

  def type
    if top_cards_equal? && third_cards_equal?
      :mutually_assured_destruction
    elsif
      top_cards_equal?
      :war
    else
      :basic
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @players.map { |player| player.deck.remove_card}
    elsif type == :war
       3.times do
         @spoils_of_war << player1.deck.remove_card
         @spoils_of_war << player2.deck.remove_card
       end
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
      @spoils_of_war.flatten
  end

  # def award_spoils(turn_winner)
  #   unless type == :mutually_assured_destruction
  #     until @spoils_of_war == []
  #       turn_winner.deck.add_card(@spoils_of_war)
  #     end
  #   end
  # end
end
