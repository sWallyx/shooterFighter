defmodule StreetFighter.UI.Screen do

  def draw_borders() do
    (0..150)
    |> Enum.each(fn limit ->
      ExNcurses.mvaddstr(0, limit, "-")
      ExNcurses.mvaddstr(10, limit, "-")
    end)
  end

end
