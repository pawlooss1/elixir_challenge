defmodule ElixirChallenge.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_challenge,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: ["lib", "test/data"],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:chunky, ">=0.13.0"}]
  end
end
