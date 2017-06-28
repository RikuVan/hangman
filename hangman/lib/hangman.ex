defmodule Hangman do

  alias Hangman.Game, as: HM

  defdelegate new_game(), to: HM
  defdelegate tally(game), to: HM

  def guess(game, guess) do
    game = HM.guess(game, guess)
    {game, tally(game)}
  end

end
