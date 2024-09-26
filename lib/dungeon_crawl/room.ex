defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Room.Trigger

  import DungeonCrawl.Room.Action

  @typedoc """
  Representation of a room with a description, the actions the user can perform and the event triggered by the room.
  """
  @type t :: %Room{description: String.t(), actions: list(Action.t()), trigger: Trigger.t()}
  defstruct description: nil, actions: [], trigger: nil

  @spec all() :: [Room.t()]
  @doc """
  Return all the rooms available in the game.
  """
  def all,
    do: [
      %Room{
        description: "You can see the light of day. You found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy
      },
      %Room{
        description: "You search the room looking for something useful.",
        actions: [forward(), search()],
        trigger: Triggers.Trap
      },
      %Room{
        description: "You search the room looking for something useful.",
        actions: [forward(), search()],
        trigger: Triggers.Treasure
      },
      %Room{
        description: "You search the room for a comfortable place to rest.",
        actions: [forward(), rest()],
        trigger: Triggers.EnemyHidden
      },
      %Room{
        description: "You search the room for a comfortable place to rest.",
        actions: [forward(), rest()],
        trigger: Triggers.Rest
      }
    ]
end
