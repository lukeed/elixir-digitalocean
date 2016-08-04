defmodule DigitalOcean.FlIP do
	@moduledoc """
	API methods for interacting with the `Floating IP` module.

	See the [Floating IP Reference](https://developers.digitalocean.com/documentation/v2/#floating-ips).
	"""

	import DigitalOcean, only: [get: 1, post: 2, del: 1, body: 1, full: 1]

	def list, do: get("floating_ips") |> full
	def list!, do: list |> body

	def show(ip), do: get("floating_ips/#{ip}") |> full
	def show!(ip), do: show(ip) |> body

	def create(data), do: post("floating_ips", data) |> full
	def create!(data), do: create(data) |> body

	def delete(ip), do: del("floating_ips/#{ip}") |> full
	def delete!(ip), do: delete(ip) |> body
end
