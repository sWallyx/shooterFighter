defmodule StreetFighter.IO.Keyboard do

  def start_listen do
    ExNcurses.listen()
    ExNcurses.noecho()
    ExNcurses.keypad()
    ExNcurses.curs_set(0)
  end

  def handle_key(?w, state), do: validate_fighter_position(state, state.fighter.x,     state.fighter.y - 1)
  def handle_key(?a, state), do: validate_fighter_position(state, state.fighter.x - 1, state.fighter.y    )
  def handle_key(?s, state), do: validate_fighter_position(state, state.fighter.x,     state.fighter.y + 1)
  def handle_key(?d, state), do: validate_fighter_position(state, state.fighter.x + 1, state.fighter.y    )
  def handle_key(?q, _),     do: ExNcurses.endwin()
  def handle_key(?k, state) do
    ExNcurses.beep()
    %{state| shots: state.shots ++ [%{x: state.fighter.x+1, y: state.fighter.y}]}
  end
  def handle_key(_, state),  do: state

  defp validate_fighter_position(state, x, y) do
    if x <= 38 && x >= 0 && y <= 39 && y >= 0 do
      %{state | fighter: %{x: x, y: y}}
    else
      state
    end
  end

end
