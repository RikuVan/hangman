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
      assert {^game, _} = HM.guess(game, "x")
    end
  end

  test "first occurance of a word is not already user" do
    game = HM.new_game()
    {game, _} = HM.guess(game, "x")
    assert game.game_state != :already_used
  end

  test "second occurance of a word is not already user" do
    game = HM.new_game()
    {game, _} = HM.guess(game, "x")
    assert game.game_state != :already_used
    {game, _} = HM.guess(game, "x")
    assert game.game_state == :already_used
  end

  test "a good guess is recognized" do
    game = HM.new_game("wibble")
    {game, _} = HM.guess(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "bad guess is recognized" do
    game = HM.new_game("wibble")
    {game, _} = HM.guess(game, "x")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end

  test "lost guess is recognized" do
    game = HM.new_game("wibble")
    {game, _} = HM.guess(game, "x")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
    {game, _} = HM.guess(game, "y")
    assert game.game_state == :bad_guess
    assert game.turns_left == 5
    {game, _} = HM.guess(game, "a")
    assert game.game_state == :bad_guess
    assert game.turns_left == 4
    {game, _} = HM.guess(game, "z")
    assert game.game_state == :bad_guess
    assert game.turns_left == 3
    {game, _} = HM.guess(game, "c")
    assert game.game_state == :bad_guess
    assert game.turns_left == 2
    {game, _} = HM.guess(game, "t")
    assert game.game_state == :bad_guess
    assert game.turns_left == 1
    {game, _} = HM.guess(game, "m")
    assert game.game_state == :lost
  end
end
