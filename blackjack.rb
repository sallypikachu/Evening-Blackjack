require 'pry'
require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    score = 0
    number_of_aces = 0
    @cards.each do |card|
      if ['J','Q','K'].include?(card.chop)
        score += 10
      elsif ['2','3','4','5','6','7','8','9','10'].include?(card.chop)
        score += card.chop.to_i
      elsif 'A' == card.chop
        number_of_aces += 1
      end
    end

    possible_scores = []
    if number_of_aces > 0
      possible_scores << score += number_of_aces
      possible_scores << score += number_of_aces + 10
      score = is_close_to_21(possible_scores)
    end

    score
  end

  private
  def is_close_to_21(score_array)
    score_array.sort!
    score_array.delete_if {|score| score > 21}
    score_array[-1]
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_score # Get this working properly
