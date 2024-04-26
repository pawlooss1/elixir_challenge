defmodule ElixirChallenge.PrimeFactorsSumFinder do
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
    self_pid = self()

    Enum.map(candidates, fn candidate ->
      spawn(fn ->
        if get_sum_of_factors(candidate) == target_sum do
          send(self_pid, candidate)
        end
      end)
    end)

    receive do
      x -> x
    end
  end

  @spec get_sum_of_factors(integer()) :: integer()
  defp get_sum_of_factors(number) do
    ElixirChallenge.Rho.sum_of_factors(number)
  end
end
