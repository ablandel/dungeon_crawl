defmodule Mix.Tasks.Start do
  use Mix.Task

  @spec run(any()) :: :ok
  @doc """
  The game entrypoint.
  """
  def run(_), do: DungeonCrawl.CLI.Main.start_game()
end
