defmodule Hangman.Server do

  alias Hangman.Game, as: HM

  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, HM.new_game()}
  end

  def handle_call({:guess, guess}, _from, game) do
    {game, tally} = HM.guess(game, guess)
    {:reply, tally, game}
  end

  def handle_call({:tally}, _from, game) do
    {:reply, HM.tally(game), game}
  end

end