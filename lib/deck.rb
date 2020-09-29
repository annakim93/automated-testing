
# deck.rb

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    STANDARD_SUITS.each do |suit|
      (1..13).each { |value| @cards << Card.new(value, suit) }
    end
  end

  def draw
    # returns a card
    return cards[rand(0..51)]
  end

  def shuffle
    # shuffles the deck
    cards.shuffle!
  end

  def count
    num_cards = 0
    until cards[num_cards].nil?
      num_cards += 1
    end
    return num_cards
  end
end
