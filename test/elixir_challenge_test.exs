defmodule ElixirChallengeTest do
  use ExUnit.Case, async: false

  test "Test solution 10 times and print mean" do
    times =
      for {chosen_candidate, target_sum, candidates} <- TestData.dataset() do
        {time, result} =
          :timer.tc(fn ->
            ElixirChallenge.PrimeFactorsSumFinder.find_number_with_factors_sum(
              candidates,
              target_sum
            )
          end)

        assert result == chosen_candidate
        time
      end

    mean_time = Enum.sum(times) / Enum.count(times)

    IO.inspect("Mean time: #{mean_time} μs")
  end
end
