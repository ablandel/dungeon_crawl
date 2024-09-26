defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  @typedoc """
  Representation of a user action.
  """
  @type t :: %Action{id: atom, label: String.t()}
  defstruct label: nil, id: nil

  @spec forward() :: Action.t()
  @doc """
  Return a forward action representation.
  """
  def forward, do: %Action{id: :forward, label: "Move forward."}

  @spec rest() :: Action.t()
  @doc """
  Return a rest action representation.
  """
  def rest, do: %Action{id: :rest, label: "Take a better look and rest."}

  @spec search() :: Action.t()
  @doc """
  Return a search action representation.
  """
  def search, do: %Action{id: :search, label: "Search the room."}

  defimpl String.Chars do
    def to_string(action), do: action.label
  end
end
