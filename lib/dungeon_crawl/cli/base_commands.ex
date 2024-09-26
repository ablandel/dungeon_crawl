defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  @spec display_options(list()) :: list()
  @doc """
  Display the options to the user from an input list. Return the input `options` list.
  """
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  @spec generate_question(list()) :: String.t()
  @doc """
  Return a enumerable question using the `options` list length.
  """
  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]\n"
  end

  @spec parse_answer(String.t()) :: integer()
  @doc """
  Return the index associated to the user response (as list index).
  """
  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end
end
