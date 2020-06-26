defmodule StreetFighter.Manager do

  alias StreetFighter.State
  alias StreetFighter.Manager.Time
  alias StreetFighter.Manager.BadGuy
  alias StreetFighter.Manager.Shot
  alias StreetFighter.Manager.Fighter

  def update(state) do
    state
    |> Time.update()
    |> BadGuy.add()
    |> Shot.update()
    |> BadGuy.destroy()
    |> BadGuy.update()
    |> verify_if_is_game_over()
  end

  defp verify_if_is_game_over(state) do
    if Fighter.was_hit?(state) || BadGuy.any_destroyed_planet?(state.badguys), do: State.initial_state(), else: state
  end

end
