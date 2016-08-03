defmodule DigitalOcean.Tag do
	@moduledoc """
	API methods for interacting with the `Tag` module.

	See the [Tag Reference](https://developers.digitalocean.com/documentation/v2/#tags).
	"""

	import DigitalOcean, only: [get: 1, post: 2, put: 2, del: 1, del: 2, body: 1, full: 1]

	def list, do: get("tags") |> full
	def list!, do: list |> body

	def create(name), do: post("tags", %{name: name}) |> full
	def create!(name), do: create(name) |> body

	def show(name), do: url(name) |> get |> full
	def show!(name), do: show(name) |> body

	def update(old, new), do: url(old) |> put(%{name: new}) |> full
	def update!(old, new), do: update(old, new) |> body

	def delete(name), do: url(name) |> del |> full
	def delete!(name), do: delete(name) |> body

	@doc """
	Get all Droplets with a given Tag. Same as `DigitalOcean.Droplet.list/1`.
	"""
	def droplets(name), do: get("droplets?tag_name=#{name}") |> full
	def droplets!(name), do: droplets(name) |> body

	@doc """
	Add the Tag to each Droplet in the list, via their IDs.
	"""
	def tag(name, list), do: post("#{url(name)}/resources", merger(list))

	@doc """
	Remove the Tag from a list of Droplets, via their IDs.
	"""
	def untag(name, list), do: del("#{url(name)}/resources", merger(list))

	defp url(tag), do: "tags/#{tag}"
	defp merger(list), do: Enum.map(list, &Map.put(&1, :resource_type, "droplet"))
end
