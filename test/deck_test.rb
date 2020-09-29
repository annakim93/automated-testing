require 'set'
require_relative 'test_helper'

describe Deck do
  # Write tests for the Deck class.
  # What should you test?
    # 1.  Expected Behavior
    # 2.  Edge cases
  describe "creates a Deck instance" do
    let (:deck) {
      Deck.new
    }
    it "is a Deck object" do
      expect(deck).must_be_instance_of Deck
    end

    it "is a Deck of Card instances" do
      expect(deck.cards[rand(0...52)]).must_be_instance_of Card
    end

    it "creates the correct number of cards for each suit" do
      count_clubs = (deck.cards.select { |card| card.suit == :clubs }).size
      count_diamonds = (deck.cards.select { |card| card.suit == :diamonds }).size
      count_hearts = (deck.cards.select { |card| card.suit == :hearts }).size
      count_spades = (deck.cards.select { |card| card.suit == :spades }).size

      expect(count_clubs).must_equal 13
      expect(count_hearts).must_equal 13
      expect(count_spades).must_equal 13
      expect(count_diamonds).must_equal 13
    end

    it "creates one of each card value for a suit" do
      test_suit = STANDARD_SUITS[rand(0..3)]
      expect(
          (deck.cards.select { |card| card.suit == test_suit }).to_set.size
      ).must_equal 13
    end
  end

  describe "Reader methods" do
    it "Can retrieve cards in deck using '.cards'" do
      expect(Deck.new).must_respond_to :cards
    end
  end

  describe "testing count" do
    it "Returns the correct number of cards in a standard deck" do
      expect(Deck.new.count).must_equal 52
    end
  end

  describe "testing draw" do
    it "draws a card that exists in the deck" do
      deck = Deck.new
      expect(
          deck.cards.include?(deck.draw)
      ).must_equal true
    end
  end

  describe "testing shuffle" do
    it "shuffles the deck such that the card order is different" do
      deck = Deck.new
      temp = deck.cards
      deck.shuffle

      expect{
        deck.cards.each_with_index do |card, idx|
          return true if card.value != temp[idx].value
        end
        return false
      }.must_output true
    end
  end
end
