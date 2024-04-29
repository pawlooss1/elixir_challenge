defmodule ElixirChallenge.PrimeFactorsSumFinder do
  # alias ElixirChallenge.Parallel

  @doc """
  A function which finds and returns a number in the `candidates` list
  for which the sum of its prime factors is equal `target_sum`.


  ## Examples

      iex> ElixirChallenge.PrimeFactorsSumFinder.find_number_with_factors_sum([8, 13, 12], 6)
      8

      iex> ElixirChallenge.PrimeFactorsSumFinder.find_number_with_factors_sum([8, 13, 12], 7)
      12

  """
  @spec find_number_with_factors_sum([integer()], integer()) :: integer()
  def find_number_with_factors_sum(candidates, target_sum) do
    candidates
    |> Enum.each(fn x ->
      spawn(helper(x, target_sum, self()))
    end)

    # waiting for first one to finish
    receive do
      {:ok, value} -> value
    end
  end

  defp helper(x, target_sum, listener) do
    fn ->
      sum =
        prime_factors(x, 2)
        |> Enum.sum()

      if sum == target_sum do
        send(listener, {:ok, x})
      end
    end
  end

  # Old version, waiting for every thread to finish
  # defp tmp(candidates, target_sum) do
  #   candidates
  #   |> Parallel.map(fn x ->
  #     sum =
  #       prime_factors(x, 2)
  #       |> Enum.sum()
  #
  #     {x, sum}
  #   end)
  #   |> Enum.find(fn res -> elem(res, 1) == target_sum end)
  #   |> elem(0)
  # end

  defp prime_factors(1, _), do: []

  defp prime_factors(n, f) when f * f > n, do: [n]

  defp prime_factors(n, f) when rem(n, f) == 0, do: [f | prime_factors(div(n, f), f)]

  defp prime_factors(n, f), do: prime_factors(n, f + 1)
end
