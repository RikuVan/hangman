defmodule Dictionary.WordList do

  @words  "../../assets/words.txt"
  @self __MODULE__

  def start_link() do
    Agent.start_link(&get_word_list/0, name: @self)
  end

   def get_word_list() do
     @words
      |> Path.expand(__DIR__)
      |> File.read!
      |> String.split(~r/\n/)
      |> Enum.drop(-1)
   end

   def random_word() do
     Agent.get(@self, &Enum.random/1)
   end

end