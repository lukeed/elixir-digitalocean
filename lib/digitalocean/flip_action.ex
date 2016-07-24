defmodule DigitalOcean.FlIP.Action do
	@moduledoc """
	API methods for interacting with the `Floating IP Action` module.

	See the [Floating IP Action Reference](https://developers.digitalocean.com/documentation/v2/#floating-ip-actions).
	"""

	import DigitalOcean, only: [get: 1, post: 2, body: 1, full: 1]

	def list(ip), do: url(ip) |> get |> full
	def list!(ip), do: list(ip) |> body

	def show(ip, act_id), do: get("#{url(ip)}/#{act_id}") |> full
	def show!(ip, act_id), do: show(ip, act_id) |> body

	def assign(ip, droplet_id), do: url(ip) |> post(%{type: "assign", droplet_id: droplet_id}) |> full
	def assign!(ip, droplet_id), do: assign(ip, droplet_id) |> body

	def unassign(ip), do: url(ip) |> post(%{type: "unassign"}) |> full
	def unassign!(ip), do: unassign(ip) |> body

	defp url(ip), do: "floating_ips/#{ip}/actions"
end
