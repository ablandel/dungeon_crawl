defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action

  @typedoc """
  Representation of a event.
  """
  @type t :: module()

  # Execute event using the character and the chosen action. Return the updated representation of the character and an atom which represent the event result used to compute next dungeon steps (for instance :exit if the dungeon exit has been found).
  @callback run(Character.t(), Action.t()) :: {Character.t(), atom}
end
