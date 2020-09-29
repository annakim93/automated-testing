
# card.rb
VALID_SUITS = [:hearts, :spades, :clubs, :diamonds]
FACE_CARDS = { 1 => 'Ace', 11 => 'Jack', 12 => 'Queen', 13 => 'King' }

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    unless VALID_SUITS.include?(suit)
      raise ArgumentError, "#{suit} is not a valid suit."
    end

    unless value.between?(1, 13) && value.class == Integer
      raise ArgumentError, "#{value} is not a valid value."
    end

    @value = value
    @suit = suit
  end

  def to_s
    if FACE_CARDS[value]
      return "#{FACE_CARDS[value]} of #{suit.to_s}"
    else
      return "#{value} of #{suit.to_s}"
    end
  end

end
