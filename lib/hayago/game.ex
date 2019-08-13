defmodule Hayago.Game do
  alias Hayago.{Game, State}
  defstruct history: [%State{}], index: 0

  #  get current state(first state in history list = current state)

  def state(%Game{history: history, index: index}) do
    Enum.at(history, index)
  end

  #   create new state struct then prepend history list

  def place(%Game{history: history, index: index} = game, position) do
    new_state =
      game
      |> Game.state()
      |> State.place(position)

    %{game | history: [new_state | Enum.slice(history, index..-1)], index: 0}
  end

  #   jump to different index

  def jump(game, destination) do
    %{game | index: destination}
  end
end
