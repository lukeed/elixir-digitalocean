defmodule DigitalOcean.Domain do
	@moduledoc """
	API methods for interacting with the `Domain` module.

	See the [Domain Reference](https://developers.digitalocean.com/documentation/v2/#domains).
	"""

	@doc """
	List all Domains.
	"""
	def list, do: get("domains")

	@doc """
	Similar to `list/0` but returns the response body only.
	"""
	def list!, do: list |> body

	@doc """
	Create a new Domain.

	## Example
		iex> DigitalOcean.Domain.create("example.com", "1.2.3.4")
		{:ok, code, head, body}
	"""
	def create(name, ip), do: post("domains", %{name: name, ip_address: ip})

	@doc """
	Similar to `create/2` but returns the response body only.
	"""
	def create!(name, ip), do: create(name, ip) |> body

	@doc """
	Get an existing Domain.
	"""
	def show(name), do: get("domains/#{name}")

	@doc """
	Similar to `show/1` but returns the response body only.
	"""
	def show!(name), do: show(name) |> body

	@doc """
	Delete a Domain.
	"""
	def delete(name), do: del("domains/#{name}")

	@doc """
	Similar to `delete/1` but returns the response body only.
	"""
	def delete!(name), do: delete(name) |> body
end
