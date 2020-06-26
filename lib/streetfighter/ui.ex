defmodule StreetFighter.UI do

  alias StreetFighter.UI.BadGuy
  alias StreetFighter.UI.Screen
  alias StreetFighter.UI.Shot
  alias StreetFighter.UI.Fighter

  def initialize do
    ExNcurses.initscr()
  end

  def draw(state) do
    ExNcurses.clear()
    Screen.draw_borders()
    Shot.draw(state.shots)
    BadGuy.draw(state.badguys)
    Fighter.draw(state.fighter)
    ExNcurses.refresh()
    state
  end

end
