defmodule DigitalOcean.Droplet.Action do
	@moduledoc """
	API methods for interacting with the `Droplet Action` module.

	See the [Droplet Action Reference](https://developers.digitalocean.com/documentation/v2/#droplet-actions).
	"""

	def list(droplet_id), do: get("droplets/#{droplet_id}/actions") |> full
	def list!(droplet_id), do: list(droplet_id) |> body
end
