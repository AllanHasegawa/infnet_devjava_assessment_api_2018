defmodule InfnetDevjavaAssessmentApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :infnet_devjava_assessment_api,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {App, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:elixir_uuid, "~> 1.2"},
    ]
  end
end
