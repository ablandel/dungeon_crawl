defmodule DungeonCrawl.CLI.HeroChoice do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  @spec start() :: Character.t()
  @doc """
  Ask the user to choose a character defined in the `DungeonCrawl.Heroes.all()` list.
  """
  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")
    heroes = DungeonCrawl.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> display_options
    |> generate_question
    |> Shell.prompt()
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end

  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end
end
