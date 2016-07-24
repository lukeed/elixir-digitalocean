defmodule DigitalOcean.Image.Action do
	@moduledoc """
	API methods for interacting with the `Image Action` module.

	See the [Image Action Reference](https://developers.digitalocean.com/documentation/v2/#image-actions).
	"""

	import DigitalOcean, only: [get: 1, post: 2, body: 1, full: 1]

	def list(img_id), do: url(img_id) |> get |> full
	def list!(img_id), do: list(img_id) |> body

	def transfer(img_id, region), do: url(img_id) |> post(%{type: "transfer", region: region}) |> full
	def transfer!(img_id, region), do: transfer(img_id, region) |> body

	def convert(img_id), do: url(img_id) |> post(%{type: "convert"}) |> full
	def convert!(img_id), do: convert(img_id) |> body

	def show(img_id, act_id), do: get("#{url(img_id)}/#{act_id}") |> full
	def show!(img_id, act_id), do: show(img_id, act_id) |> body

	defp url(id), do: "images/#{id}/actions"
end
