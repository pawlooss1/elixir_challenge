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
    Enum.filter(candidates, fn candidate -> get_sum_of_factors(candidate) == target_sum end)
    |> hd()
  end

  @spec get_sum_of_factors(integer()) :: integer()
  def get_sum_of_factors(number) do
    Chunky.Math.prime_factors(number)
    |> Enum.sum()
    |> Kernel.-(1)
  end
end
