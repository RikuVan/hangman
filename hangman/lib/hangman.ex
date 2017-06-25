defmodule Hangman do

  alias Hangman.Game, as: HM

  defdelegate new_game(), to: HM

end
