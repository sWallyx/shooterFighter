defmodule StreetFighter.State do

  def initial_state do
    %{fighter: %{x: 10, y: 5}, shots: [], badguys: [], time: 0}
  end

end
