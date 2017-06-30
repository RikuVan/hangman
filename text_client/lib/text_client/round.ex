defmodule TextClient.Round do

  alias TextClient.State

  def next(game) do
    tally = Hangman.guess(game.game_service, game.guess)
    %State{ game | tally: tally}
  end

end