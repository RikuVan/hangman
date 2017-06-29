defmodule TextClient.Round do

  alias TextClient.State

  def next(game) do
    {gs, tally} = Hangman.guess(game.game_service, game.guess)
    %State{ game | game_service: gs, tally: tally}
  end

end