defmodule DigitalOcean.Key do
	@moduledoc """
	API methods for interacting with the `SSH Key` module.

	See the [SSH Key Reference](https://developers.digitalocean.com/documentation/v2/#ssh-keys).
	"""

	@doc """
	List all SSH Keys.
	"""
	def list, do: get("account/keys")

	@doc """
	Similar to `list/0` but returns the response body only.
	"""
	def list!, do: list |> body

	@doc """
	Create a new SSH Key.

	## Example
		iex> DigitalOcean.Key.create("My SSH Public Key", "ssh-rsa AAA...4V example")
	"""
	def create(name, pub_key), do: post("account/keys", %{name: name, public_key: pub_key})

	@doc """
	Similar to `create/2` but returns the response body only.
	"""
	def create!(name, pub_key), do: create(name, pub_key) |> body

	@doc """
	Get a SSH Key by the key's `id` or its `fingerprint`.

	## Example
		iex> DigitalOcean.Key.show(512190)
	"""
	def show(key_id), do: get("account/keys/#{key_id}")

	@doc """
	Similar to `show/1` but returns the response body only.
	"""
	def show(key_id), do: show(key_id) |> body

	@doc """
	Update a SSH Key's name.

	## Example
		iex> DigitalOcean.Key.update(512190, "Renamed SSH Key")
	"""
	def update(key_id, name), do: put("account/keys/#{key_id}", %{name: name})

	@doc """
	Similar to `update/2` but returns the response body only.
	"""
	def update!(key_id, name), do: update(key_id, name) |> body

	@doc """
	Delete a SSH Key by its `id` or `fingerprint`.
	"""
	def delete(key_id), do: del("account/keys/#{key_id}")

	@doc """
	Similar to `delete/2` but returns the response body only.
	"""
	def delete!(key_id), do: delete(key_id) |> body
end
