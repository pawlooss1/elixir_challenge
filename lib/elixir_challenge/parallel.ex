defmodule ElixirChallenge.Parallel do
  def map(collection, func) do
    collection
    |> Enum.map(&Task.async(fn -> func.(&1) end))
    |> Enum.map(fn x -> Task.await(x, :infinity) end)
  end
end
