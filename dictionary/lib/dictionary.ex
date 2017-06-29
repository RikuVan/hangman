defmodule Dictionary do

  alias Dictionary.WordList, as: WL

  defdelegate random_word(), to: WL

end