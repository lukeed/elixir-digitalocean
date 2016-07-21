defmodule DigitalOcean.Volume do
	@moduledoc """
	API methods for interacting with the `Block Storage` module.

	See the [Block Storage Reference](https://developers.digitalocean.com/documentation/v2/#block-storage).
	"""

	import DigitalOcean, only: [get: 1, post: 2, del: 1, body: 1]

	@doc """
	List all Block Storage volumes.
	"""
	def list, do: get("volumes")

	@doc """
	Similar to `list/0` but returns the response body only.
	"""
	def list!, do: list |> body

	@doc """
	Create a new volume.

	## Example
		iex> DigitalOcean.Volume.create("example", 10, "nyc1", "Block store for examples.")
	"""
	def create(name, size, region, desc \\ "") do
		post("volumes", %{name: name, size_gigabytes: size, region: region, description: desc})
	end

	@doc """
	Similar to `create/4` but returns the response body only.
	"""
	def create!(name, size, region, desc \\ ""), do: create(name, size, region, desc) |> body

	@doc """
	Get Volume information by its `id`.

	## Example
		iex> DigitalOcean.Volume.show("7724db7c-e098-11e5-b522-000f53304e51")
	"""
	def show(vol_id), do: get("volumes/#{vol_id}")

	@doc """
	Similar to `show/1` but returns the response body only.
	"""
	def show(vol_id), do: show(vol_id) |> body

	@doc """
	Get Volume information by its `name` and `region` pair.

	## Example
		iex> DigitalOcean.Volume.show("example", "nyc1")
	"""
	def show(name, region), do: get("volumes?name=#{name}&region=#{region}")

	@doc """
	Similar to `show/2` but returns the response body only.
	"""
	def show!(name, region), do: show(name, region) |> body

	@doc """
	Delete a Volume by its `id`.
	"""
	def delete(vol_id), do: del("volumes/#{vol_id}")

	@doc """
	Similar to `delete/1` but returns the response body only.
	"""
	def delete!(vol_id), do: delete(vol_id) |> body

	@doc """
	Delete a Volume by its `name` and `region` pair.
	"""
	def delete(name, region), do: del("volumes?name=#{name}&region=#{region}")

	@doc """
	Similar to `delete/2` but returns the response body only.
	"""
	def delete!(name, region), do: delete(name, region) |> body
end
