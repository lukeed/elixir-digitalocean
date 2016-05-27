defmodule DigitalOcean do
	@host "https://api.digitalocean.com/v2/"
	@api_token "YOUR_TOKEN_HERE"
	@per_page 25

	def build_url(path) do
		@host <> path
	end
end
