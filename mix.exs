defmodule DigitalOcean.Mixfile do
  use Mix.Project

  def project do [
    app: :digitalocean,
    version: "0.1.0",
    elixir: "~> 1.3",
    description: "(WIP) Elixir wrapper for the Digital Ocean API v2.",
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env == :prod,
    deps: deps()
  ] end

  def application do
    [applications: [:poison, :httpoison]]
  end

  defp deps do [
    {:poison, "~> 2.2"},
    {:httpoison, "~> 0.9.0"},
    {:ex_doc, "~> 0.13.0", only: :dev}
  ] end

  defp package do [
    name: :digitalocean,
    maintainers: ["Luke Edwards"],
    licenses: ["MIT"],
    links: %{
      "GitHub" => "https://github.com/lukeed/elixir-digitalocean",
      "Docs" => "https://hex.pm/packages/digitalocean"
    }
  ] end
end
