defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """
  @doc """
  Returns a list of strings representing a deck of cards.
  """
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King",
      "Ace"
    ]

    suits = ["Spades", "Clubs", "Diamonds", "Hearts"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)

      {:error, _reason} ->
        "There was a problem."
    end
  end

  @doc """
  Creates and shuffles a deck, picks five cards and returns those cards and the remaining cards in the deck.

  ## Example
      iex(3)> {hand,rest_of_deck} = Cards.create_hand(5)
      iex(4)> hand
      ["Two of Diamonds", "Four of Hearts", "Nine of Diamonds", "Queen of Hearts",
      "Ace of Diamonds"]

  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
