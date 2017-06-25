defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game, as: HM

  test "new game returns structure" do

    game = HM.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [:won, :lost] do
      game = HM.new_game() |> Map.put(:game_state, state)
      assert { ^game, _ } = HM.guess(game, "x")
    end
  end
end
