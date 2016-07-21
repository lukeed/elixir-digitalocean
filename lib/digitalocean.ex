defmodule DigitalOcean do
	@moduledoc """
	Elixir wrapper for the [Digital Ocean API, v2](https://developers.digitalocean.com/documentation/v2/).
	"""

	use HTTPoison.Base

	@host "https://api.digitalocean.com/v2/"
	# @per_page 25

	defp get_token, do: System.get_env("DO_API_TOKEN")

	defp process_url(path), do: @host <> path

	defp process_request_headers(headers) do
		[{"Content-type", "application/json"}, {"Authorization", "Bearer #{get_token}"}] ++ headers
	end

	defp process_response_body(""), do: ""
	defp process_response_body(body), do: Poison.decode!(body, keys: :atoms)

	@doc """
	Parse & Return only the `body` from HTTPoison's response tuple.
	"""
	def body({_, body, _}), do: body

	def del(path), do: delete(path)
end
