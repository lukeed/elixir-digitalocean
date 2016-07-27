defmodule DigitalOcean.Droplet do
	@moduledoc """
	API methods for interacting with the `Droplet` module.

	See the [Droplet Reference](https://developers.digitalocean.com/documentation/v2/#droplets).
	"""

	@doc """
	List all Droplets.
	"""
	def list, do: get("droplets") |> full

	@doc """
	Similar to `list/0` but returns the response body only.
	"""
	def list!, do: list |> body

	@doc """
	Get all Droplets with a given Tag. Same as `DigitalOcean.Tag.droplets/1`.
	"""
	def list(tag), do: get("droplets?tag_name=#{tag}") |> full

	@doc """
	Similar to `list/1` but returns the response body only.
	"""
	def list!(tag), do: list(tag) |> body
end
