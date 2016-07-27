defmodule DigitalOcean.Tag do
	@moduledoc """
	API methods for interacting with the `Tag` module.

	See the [Tag Reference](https://developers.digitalocean.com/documentation/v2/#tags).
	"""

	import DigitalOcean, only: [get: 1, post: 2, put: 2, del: 1, body: 1, full: 1]

	def list, do: get("tags") |> full
	def list!, do: list |> body

	def create(name), do: post("tags", %{name: name}) |> full
	def create!(name), do: create(name) |> body

	def show(name), do: get("tags/#{name}") |> full
	def show!(name), do: show(name) |> body

	def update(old, new), do: put("tags/#{old}", %{name: new}) |> full
	def update!(old, new), do: update(old, new) |> body

	def delete(name), do: del("tags/#{name}") |> full
	def delete!(name), do: delete(name) |> body

	@doc """
	Get all Droplets with a given Tag. Same as `DigitalOcean.Droplet.list/1`.
	"""
	def droplets(name), do: get("droplets?tag_name=#{name}") |> full
	def droplets!(name), do: droplets(name) |> body

	# TODO: `Resource` struct?
	# TODO: tag & untag resource
end
