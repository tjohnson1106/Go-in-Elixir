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

  def legal?(game, position) do
    State.legal?(Game.state(game), position) and
      not repeated_state?(game, position)
  end

  defp repeated_state?(game, position) do
    %Game{
      history: [
        %State{positions: tentative__positions} | history
      ]
    } = Game.place(game, position)

    Enum.any?(history, fn %State{positions: positions} ->
      positions == tentative__positions
    end)
  end
end
