defmodule Hayago.Game do
  alias Hayago.{Game, State}
  defstruct history: [%State{}], index: 0

  #  get current state(first state in history list = current state)

  def state(%Game{history: [state | _]}) do
    state
  end

  #   create new state struct then prepend history list

  def place(%Game{history: [state | _] = history} = game, position) do
    %{game | history: [State.place(state, position) | history]}
  end
end
