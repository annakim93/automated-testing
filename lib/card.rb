
# card.rb
VALID_SUITS = [:hearts, :spades, :clubs, :diamonds]

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
    return "#{value} of #{suit.to_s}"
  end

end
