defmodule StreetFighter.Manager.Shot do

  alias StreetFighter.Manager.BadGuy

  def update(state) do
    %{state | shots: generate_new_positions(state.shots)}
  end

  def valids(state) do
    state.shots
    |> Enum.filter(fn shot ->
      not Enum.any?(state.badguys, fn badguy ->
        BadGuy.was_destroyed?(badguy, shot)
      end)
    end)
  end

  defp generate_new_positions(shots) do
    shots
    |> Enum.map(fn shot -> %{x: shot.x + 1, y: shot.y} end)
    |> Enum.filter(fn shot -> shot.x >= 0 && shot.y >= 0 end)
  end

end
