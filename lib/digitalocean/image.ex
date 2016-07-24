defmodule DigitalOcean.Image do
	@moduledoc """
	API methods for interacting with the `Image` module.

	See the [Image Reference](https://developers.digitalocean.com/documentation/v2/#images).
	"""

	import DigitalOcean, only: [get: 1, put: 2, del: 1, body: 1, full: 1]

	def list, do: get("images") |> full
	def list!, do: list |> body

	# "application" or "distribution"
	def list(type), do: get("images?type=#{type}") |> full
	def list!(type), do: list(type) |> body

	def list_private, do: get("images?private=true") |> full
	def list_private!, do: list_private |> body

	def show(image_id), do: get("images/#{image_id}") |> full
	def show!(image_id), do: show(image_id) |> body

	def update(image_id, attr), do: put("images/#{image_id}", attr) |> full
	def update!(image_id, attr), do: put(image_id, attr) |> body

	def delete(image_id), do: del(image_id) |> full
	def delete!(image_id), do: delete(image_id) |> body
end
