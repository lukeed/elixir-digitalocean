defmodule DigitalOcean do
	@moduledoc """
	Elixir wrapper for the [Digital Ocean API, v2](https://developers.digitalocean.com/documentation/v2/).
	"""

	use HTTPoison.Base

	@host "https://api.digitalocean.com/v2/"
	@api_token "YOUR_TOKEN_HERE"
	@per_page 25

	def build_url(path) do
		@host <> path
	end
end
