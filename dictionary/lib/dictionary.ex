defmodule Dictionary do

  def random_word do
    "../assets/words.txt"
      |> Path.expand(__DIR__)
      |> File.read!
      |> String.split(~r/\n/)
      |> Enum.drop(-1)
      |> Enum.random()
  end
end
