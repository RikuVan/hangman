defmodule TextClient.Prompter do

  alias TextClient.{State}

  def accept_guess(game = %State{}) do
    input = IO.gets("your guess: ")
    |> validate(game)
  end

  defp validate({:error, reason}, _) do
    IO.puts("Game ended: #{reason}")
    exit(:normal)
  end

  defp validate(:eof, _) do
    IO.puts("Looks like you gave up")
    exit(:normal)
  end

  defp validate(input, game = %State{}) do
    input = input |> String.downcase |> String.trim
    cond do
      input =~ ~r/\A[a-z]\z/ ->
        Map.put(game, :guess, input)
      true ->
        IO.puts "please enter a single lowercase letter"
        accept_guess(game)
    end
  end

end