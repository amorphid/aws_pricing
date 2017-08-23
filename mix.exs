defmodule AWSPricing.Mixfile do
  use Mix.Project

  def project do
    [
      app: :aws_pricing,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {AWSPricing.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:poison, "~> 3.1"},
    ]
  end
end
