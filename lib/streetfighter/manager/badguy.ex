defmodule StreetFighter.Manager.BadGuy do

  alias StreetFighter.Manager.Shot

  def update(state) do
    if rem(state.time, 5) == 0 do
      %{state | badguys: generate_new_positions(state.badguys)}
    else
      state
    end
  end

  def add(state) do
    if rem(state.time, 100) == 0 do
      %{state | badguys: state.badguys ++ [%{x: 100, y: :rand.uniform(10)}]}
    else
      state
    end
  end

  def destroy(state) do
    %{state | badguys: valids(state), shots: Shot.valids(state)}
  end

  def valids(state) do
    state.badguys
    |> Enum.filter(fn badguy ->
      not Enum.any?(state.shots, fn shot ->
        was_destroyed?(badguy, shot)
      end)
    end)
  end

  def any_was_destroyed?(state) do
    state.badguys
    |> Enum.any?(fn badguy ->
      Enum.any?(state.shots, fn shot ->
        was_destroyed?(badguy, shot)
      end)
    end)
  end

  def any_destroyed_planet?(badguys) do
    badguys
    |> Enum.any?(fn badguy -> badguy.y >= 38 end)
  end

  def was_destroyed?(badguy, shot) do
    (badguy.x <= shot.x && shot.x <= badguy.x+2) && (badguy.y <= shot.y && shot.y <= badguy.y+1)
  end

  defp generate_new_positions(badguys) do
    badguys
    |> Enum.map(fn badguy -> %{x: badguy.x - 1, y: badguy.y} end)
  end

end
