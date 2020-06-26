defmodule StreetFighter do

  alias StreetFighter.UI
  alias StreetFighter.IO.Keyboard
  alias StreetFighter.State

  def run do
    UI.initialize()
    Keyboard.start_listen()
    schedule_next_tick()
    State.initial_state()
    |> loop()
  end

  def loop(state) do
    receive do
      {:ex_ncurses, :key, key} ->
        loop(Keyboard.handle_key(key, state))

      :tick ->
        schedule_next_tick()
        state
        |> UI.draw()
        |> StreetFighter.Manager.update()
        |> loop()
    end
  end

  def schedule_next_tick do
    Process.send_after(self(), :tick, 33)
  end

end
