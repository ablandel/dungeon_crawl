defmodule DungeonCrawl.Battle do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  @spec fight(Character.t(), Character.t()) :: {Character.t(), Character.t()}
  @doc """
  Make `char_a` fights `char_b` in a turn based fight. `char_a` will hit first.
  """
  def fight(
        char_a = %{hit_points: hit_points_a},
        char_b = %{hit_points: hit_points_b}
      )
      when hit_points_a == 0 or hit_points_b == 0,
      do: {char_a, char_b}

  def fight(char_a, char_b) do
    char_b_after_damage = attack(char_a, char_b)
    char_a_after_damage = attack(char_b_after_damage, char_a)
    fight(char_a_after_damage, char_b_after_damage)
  end

  defp attack(%{hit_points: hit_points_a}, character_b)
       when hit_points_a == 0,
       do: character_b

  defp attack(char_a, char_b) do
    damage = Enum.random(char_a.damage_range)
    char_b_after_damage = Character.take_damage(char_b, damage)

    char_a
    |> attack_message(damage)
    |> Shell.info()

    char_b_after_damage
    |> receive_message(damage)
    |> Shell.info()

    char_b_after_damage
  end

  defp attack_message(character = %{name: "You"}, damage) do
    "You attack with #{character.attack_description} " <>
      "and deal #{damage} damage."
  end

  defp attack_message(character, damage) do
    "#{character.name} attacks with " <>
      "#{character.attack_description} and " <>
      "deals #{damage} damage."
  end

  defp receive_message(character = %{name: "You"}, damage) do
    "You receive #{damage}. Current HP: #{character.hit_points}."
  end

  defp receive_message(character, damage) do
    "#{character.name} receives #{damage}. " <>
      "Current HP: #{character.hit_points}."
  end
end
