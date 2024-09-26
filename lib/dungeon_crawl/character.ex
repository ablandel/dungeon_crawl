defmodule DungeonCrawl.Character do
  alias DungeonCrawl.Character

  @typedoc """
  A character representation with generic information (as name or description) and fighting capabilities.
  """
  @type t :: %Character{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer,
          max_hit_points: non_neg_integer,
          attack_description: String.t(),
          damage_range: Range.t()
        }
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  defimpl String.Chars do
    def to_string(character), do: character.name
  end

  @spec take_damage(Character.t(), number()) :: Character.t()
  @doc """
  Reduce `damage` hit points to `character`.
  """
  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %{character | hit_points: new_hit_points}
  end

  @spec heal(Character.t(), number()) :: Character.t()
  @doc """
  Restore `healing_value` hit points to `character`.
  """
  def heal(character, healing_value) do
    new_hit_points =
      min(
        character.hit_points + healing_value,
        character.max_hit_points
      )

    %{character | hit_points: new_hit_points}
  end

  @spec current_stats(Character.t()) :: String.t()
  @doc """
  Return `character` hit points stats as a formated string.
  """
  def current_stats(character),
    do: "Player Stats\nHP: #{character.hit_points}/#{character.max_hit_points}"
end
