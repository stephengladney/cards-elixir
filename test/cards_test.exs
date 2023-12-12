defmodule CardsTest do
  use ExUnit.Case
  # doctest Cards

  test "create_deck generates 56 cards" do
    assert 56 ==
             Cards.create_deck()
             |> length
  end
end
