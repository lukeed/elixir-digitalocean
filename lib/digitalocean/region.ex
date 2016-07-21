defmodule DigitalOcean.Region do
	@moduledoc """
	API methods for interacting with the `Region` module.

	See the [Region Reference](https://developers.digitalocean.com/documentation/v2/#regions).
	"""

	@doc """
	List all Regions.
	"""
	def list, do: get("regions")

	@doc """
	Similar to `list/0` but returns the response body only.
	"""
	def list!, do: list |> body
end
