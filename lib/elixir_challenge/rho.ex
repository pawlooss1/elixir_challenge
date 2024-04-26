defmodule ElixirChallenge.Rho do
  import ElixirChallenge.Prime
  @spec sum_of_factors(pos_integer()) :: non_neg_integer()
  def sum_of_factors(1), do: 0

  def sum_of_factors(n) do
    case f = pollard_rho(n) do
      ^n -> n
      _ -> sum_of_factors(f) + sum_of_factors(div(n, f))
    end
  end

  @spec factorize(pos_integer()) :: [pos_integer()]
  def factorize(1), do: []

  def factorize(n) do
    case f = pollard_rho(n) do
      ^n -> [n]
      _ -> factorize(f) ++ factorize(div(n, f))
    end
  end

  @spec pollard_rho(pos_integer()) :: pos_integer()
  def pollard_rho(n) do
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