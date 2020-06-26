defmodule StreetFighter.UI.BadGuy do

  def draw(badguys) do
    Enum.each(badguys, fn badguy ->
      ExNcurses.mvaddstr(0 + badguy.y, 1 + badguy.x, "o")
      ExNcurses.mvaddstr(1 + badguy.y, 0 + badguy.x, "/")
      ExNcurses.mvaddstr(1 + badguy.y, 1 + badguy.x, "|")
      ExNcurses.mvaddstr(1 + badguy.y, 2 + badguy.x, "\\")
      ExNcurses.mvaddstr(2 + badguy.y, 0 + badguy.x, "/")
      ExNcurses.mvaddstr(2 + badguy.y, 2 + badguy.x, "\\")
    end)
  end

end

