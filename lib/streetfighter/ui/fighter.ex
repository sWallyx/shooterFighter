defmodule StreetFighter.UI.Fighter do

  def draw(fighter) do
    ExNcurses.mvaddstr(0 + fighter.y, 1 + fighter.x, "o")
    ExNcurses.mvaddstr(1 + fighter.y, 0 + fighter.x, "/")
    ExNcurses.mvaddstr(1 + fighter.y, 1 + fighter.x, "|")
    ExNcurses.mvaddstr(1 + fighter.y, 2 + fighter.x, "\\")
    ExNcurses.mvaddstr(2 + fighter.y, 0 + fighter.x, "/")
    ExNcurses.mvaddstr(2 + fighter.y, 2 + fighter.x, "\\")
  end

end
