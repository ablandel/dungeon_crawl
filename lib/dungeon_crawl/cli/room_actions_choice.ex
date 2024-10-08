defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Room
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  @spec start(Room.t()) :: {Room.t(), Action.t()}
  @doc """
  Ask the user to choose an action in the given room.
  """
  def start(room) do
    room_actions = room.actions
    find_action_by_index = &Enum.at(room_actions, &1)
    Shell.info(room.description)

    chosen_action =
      room_actions
      |> display_options
      |> generate_question
      |> Shell.prompt()
      |> parse_answer
      |> find_action_by_index.()

    {room, chosen_action}
  end
end
