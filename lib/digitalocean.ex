defmodule DigitalOcean do
	@moduledoc """
	Elixir wrapper for the [Digital Ocean API, v2](https://developers.digitalocean.com/documentation/v2/).
	"""

	use HTTPoison.Base

	@host "https://api.digitalocean.com/v2/"
	# @per_page 25

	defp get_token, do: Application.get_env(:digitalocean, :token)

	defp process_url(path), do: @host <> path

	defp process_request_headers(headers) do
		[{"Content-type", "application/json"}, {"Authorization", "Bearer #{get_token}"}] ++ headers
	end

	defp process_response_body(""), do: ""
	defp process_response_body(body), do: Poison.decode!(body, keys: :atoms)

	@doc """
	Format the `HTTPoison.Response` struct as a tuple.
	"""
	def full({status, res}) when status === :ok, do: {status, res.body, res.headers}
	def full({status, res}) when status === :error, do: {status, res.reason}

	@doc """
	Return only the `body` key from the `full/1` response tuple.
	"""
	def body({_, bod, _}), do: bod

	@doc """
	Shortname for `delete/1`
	"""
	def del(path), do: delete(path)

	@doc """
	Shortname for `delete/2`
	"""
	def del(path, data), do: delete(path, encode(data))

	defp encode(map), do: Poison.encode!(map)
end
