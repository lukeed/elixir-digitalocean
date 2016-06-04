defmodule DigitalOcean.Account do
	@moduledoc """
	API methods for interacting with the `Account` module.

	See the [Account Reference](https://developers.digitalocean.com/documentation/v2/#account).
	"""

	@doc """
	Get information about the Account associated with the token.

	## Example
		iex> DigitalOcean.Account.show
	"""
	def show, do: get("account")

	@doc """
	Similar to `show/0` but returns the response body only.
	"""
	def show!, do: show |> body
end
