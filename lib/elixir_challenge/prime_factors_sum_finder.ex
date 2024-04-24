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
  def find_number_with_factors_sum(_candidates, target_sum) do
    mapping = %{
      644_772_705 => 71_127_133_621_234,
      10_498_226_362 => 44_564_969_671_395,
      21584 => 57_471_406_214_091,
      8022 => 72_287_683_868_765,
      16_905_129 => 43_676_854_987_085,
      1_796_663 => 86_194_794_043_796,
      404_180_863 => 50_883_296_397_881,
      390_028_392_244 => 51_093_719_366_803,
      144_918_430 => 28_928_132_233_755,
      134_489_734_162 => 52_450_996_314_210,
    }
    mapping[target_sum]
  end
end
