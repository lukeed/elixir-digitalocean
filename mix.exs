defmodule DigitalOcean.Mixfile do
  use Mix.Project

  @description """
  A (WIP) Elixir wrapper for the Digital Ocean API v2.
  """

  def project do [
    app: :digitalocean,
    version: "0.0.1",
    elixir: "~> 1.2",
    description: @description,
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env == :prod,
    package: package,
    deps: deps()
  ] end

  def application do
    [applications: [:poison, :httpoison]]
  end

  defp deps do [
    {:poison, "~> 2.2"},
    {:httpoison, "~> 0.9.0"},
    {:ex_doc, "~> 0.13.0", only: :dev},
    {:bypass, "~> 0.1", only: :test}
  ] end

  defp package do [
    name: :digitalocean,
    maintainers: ["Luke Edwards"],
    licenses: ["MIT"],
    links: %{"GitHub" => "https://github.com/lukeed/elixir-digitalocean"}
  ] end
end
