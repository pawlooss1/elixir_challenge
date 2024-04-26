defmodule ElixirChallenge.Prime do
  @spec prime?(pos_integer()) :: boolean()
  def prime?(n) when n < 2 or rem(rem(n, 6), 4) != 1, do: n == 2 or n == 3

  def prime?(n) do
    do_test(n, 20)
  end

  defp do_test(_n, 0), do: true

  defp do_test(n, k) do
    p = Enum.random(2..(n - 1))

    if fast_powmod_with_check(p, n - 1, n) == 1 do
      do_test(n, k - 1)
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
