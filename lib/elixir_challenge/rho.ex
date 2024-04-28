defmodule ElixirChallenge.Rho do
  import ElixirChallenge.Prime

  @doc """
  Returns sum of prime factors of n. Uses Pollard's rho algorithm.
  """
  @spec sum_of_factors(pos_integer()) :: non_neg_integer()
  def sum_of_factors(n) when n < 5_000_000 do
    sum_of_factors_small(n, 2, 0)
  end

  def sum_of_factors(n) do
    case f = pollard_rho(n) do
      ^n -> n
      _ -> sum_of_factors(f) + sum_of_factors(div(n, f))
    end
  end

  defp sum_of_factors_small(1, _d, factors_sum), do: factors_sum

  defp sum_of_factors_small(n, d, factors_sum) when d * d > n do
    factors_sum + n
  end

  defp sum_of_factors_small(n, 2, factors_sum) when rem(n, 2) == 0 do
    sum_of_factors_small(div(n, 2), 2, factors_sum + 2)
  end

  defp sum_of_factors_small(n, 2, factors_sum) do
    sum_of_factors_small(n, 3, factors_sum)
  end

  defp sum_of_factors_small(n, d, factors_sum) when rem(n, d) == 0 do
    sum_of_factors_small(div(n, d), d, factors_sum + d)
  end

  defp sum_of_factors_small(n, d, factors_sum) do
    sum_of_factors_small(n, d + 2, factors_sum)
  end

  # @spec factorize(pos_integer()) :: [pos_integer()]
  # def factorize(1), do: []

  # def factorize(n) do
  #   case f = pollard_rho(n) do
  #     ^n -> [n]
  #     _ -> factorize(f) ++ factorize(div(n, f))
  #   end
  # end

  @spec pollard_rho(pos_integer()) :: pos_integer()
  defp pollard_rho(n) do
    if n == 1 or prime?(n) do
      n
    else
      loop(0, 0, 0, 2, n)
    end
  end

  defp loop(x, y, c, prod, n) do
    c = if x == y, do: Enum.random(1..(n - 1)), else: c
    prod = if (r = rem(prod * (x - y), n)) > 0, do: r, else: prod

    f = fn a -> rem(a * a + c, n) end

    case Integer.gcd(prod, n) do
      1 -> loop(f.(x), f.(f.(y)), c, prod, n)
      g -> g
    end
  end
end
