defmodule StreetFighter.Manager.Fighter do

  def was_hit?(state) do
    state.badguys
    |> Enum.any?(fn badguy -> was_destroyed?(badguy, state.fighter) end)
  end

  defp was_destroyed?(badguy, fighter) do
    (badguy.x <= fighter.x && fighter.x <= badguy.x+2) && (badguy.y <= fighter.y && fighter.y <= badguy.y+1) ||
      (badguy.x <= fighter.x+2 && fighter.x+2 <= badguy.x+2) && (badguy.y <= fighter.y && fighter.y <= badguy.y+1) ||
      (badguy.x <= fighter.x && fighter.x <= badguy.x+2) && (badguy.y <= fighter.y+1 && fighter.y+1 <= badguy.y+1) ||
      (badguy.x <= fighter.x+2 && fighter.x <= badguy.x+2) && (badguy.y <= fighter.y+1 && fighter.y+1 <= badguy.y+1)
  end

end
