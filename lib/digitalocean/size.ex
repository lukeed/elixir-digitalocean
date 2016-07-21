defmodule DigitalOcean.Size do
	@moduledoc """
	API methods for interacting with the `Size` module.

	See the [Size Reference](https://developers.digitalocean.com/documentation/v2/#sizes).
	"""

	@doc """
	List all Sizes.
	"""
	def list, do: get("sizes")

	@doc """
	Similar to `list/0` but returns the response body only.
	"""
	def list!, do: list |> body
end
