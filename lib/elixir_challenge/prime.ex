defmodule ElixirChallenge.Prime do
  @spec prime?(pos_integer()) :: boolean()
  def prime?(n) when n < 2 or rem(rem(n, 6), 4) != 1, do: n == 2 or n == 3

  def prime?(n) do
    candidates =
      get_candidates(n)
      |> Enum.filter(fn c -> rem(c, n) != 0 end)

    do_test(n, candidates)
  end

  defp get_candidates(n) when n < 9_080_191, do: [31, 73]
  defp get_candidates(n) when n < 4_759_123_141, do: [2, 7, 61]
  defp get_candidates(n) when n < 2_152_302_898_747, do: [2, 3, 5, 7, 11]
  defp get_candidates(n) when n < 341_550_071_728_321, do: [2, 3, 5, 7, 11, 13, 17]
  defp get_candidates(n), do: Enum.map(1..20, fn _ -> Enum.random(2..(n - 1)) end)

  defp do_test(_n, []), do: true

  defp do_test(n, candidates) do
    [p | candidates] = candidates

    if fast_powmod_with_check(p, n - 1, n) == 1 do
      do_test(n, candidates)
    else
      false
    end
  end

  defp fast_powmod_with_check(_base, 0, _mod), do: 1

  defp fast_powmod_with_check(base, exp, mod) when rem(exp, 2) == 0 do
    case fast_powmod_with_check(base, div(exp, 2), mod) do
      x when rem(x * x, mod) == 1 and x != 1 and x != mod - 1 -> 0
      x -> rem(x * x, mod)
    end
  end

  defp fast_powmod_with_check(base, exp, mod) do
    rem(base * fast_powmod_with_check(base, exp - 1, mod), mod)
  end
end
