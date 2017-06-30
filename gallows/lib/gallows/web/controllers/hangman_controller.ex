defmodule Gallows.Web.HangmanController do
  use Gallows.Web, :controller

  def new_game(conn, _params) do
    render conn, "new_game.html", test: nil
  end

  def create_game(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    conn
    |> put_session(:game, game)
    |> render("game_field.html", tally: tally)
  end

  def guess(conn, %{"guess" => %{"guess" => letter}}) do
    tally =
      conn
       |> get_session(:game)
       |> Hangman.guess(letter)
    put_in(conn.params["guess"]["guess"], "")
      |> render("game_field.html", tally: tally)
  end
end
