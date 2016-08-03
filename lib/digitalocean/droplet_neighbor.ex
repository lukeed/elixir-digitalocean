defmodule DigitalOcean.Droplet.Neighbor do
	@moduledoc """
	API methods for interacting with Droplet Neighbors module.

	See the [Droplet Reference](https://developers.digitalocean.com/documentation/v2/#list-all-droplet-neighbors).
	"""

	import DigitalOcean, only: [get: 1, body: 1, full: 1]

	@doc """
	List *any/all* Droplets sharing the same physical hardware.
	"""
	def list, do: get("reports/droplet_neighbors") |> full
	def list!, do: list |> body

	@doc """
	Show neighbors for a given Droplet.
	"""
	def show(droplet_id), do: get("droplets/#{droplet_id}/neighbors") |> full
	def show!(droplet_id), do: show_neighbors(droplet_id) |> body
end
