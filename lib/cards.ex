defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling deck of cards
  """

  @doc """
  Returns a list of string representing a deck of playing cards
  """
  def create_deck do
    values =["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

@doc """
shuffles the deck
"""
  def shuffle (deck) do
    Enum.shuffle(deck)
  end

@doc """
  Determines wether a deck contain a given card

## examples

    iex(1)> deck = Cards.create_deck
    iex(2)> Cards.contains?(deck, "Ace of Spades")
    true  
"""
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

@doc """
 Divides a deck into a hand.... `hand_size`

## Examples

     iex> deck = Cards.create_deck
     iex> {hand, deck} = Cards.deal(deck,1)
     iex> hand
     ["Ace of Spades"]

"""
  def deal(deck, hand_size)do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file #{filename} does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |>Cards.shuffle
    |>Cards.deal(hand_size)

  end

end
