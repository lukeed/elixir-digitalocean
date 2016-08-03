defmodule DigitalOcean.Droplet.Action do
	@moduledoc """
	API methods for interacting with the `Droplet Action` module.

	See the [Droplet Action Reference](https://developers.digitalocean.com/documentation/v2/#droplet-actions).
	"""

	import DigitalOcean, only: [get: 1, post: 2, body: 1, full: 1]

	def list(id), do: url(id) |> get |> full
	def list!(id), do: list(id) |> body

	def show(id, act_id), do: "#{url(id)}/#{act_id}" |> get |> full
	def show!(id, act_id), do: show(id, act_id) |> body

	def enable_backups(id), do: url(id) |> post(%{type: "enable_backups"}) |> full
	def disable_backups(id), do: url(id) |> post(%{type: "disable_backups"}) |> full

	def shutdown(id), do: url(id) |> post(%{type: "disable_backups"}) |> full
	def reboot(id), do: url(id) |> post(%{type: "disable_backups"}) |> full
	def cycle(id), do: url(id) |> post(%{type: "disable_backups"}) |> full
	def off(id), do: url(id) |> post(%{type: "disable_backups"}) |> full
	def on(id), do: url(id) |> post(%{type: "disable_backups"}) |> full

	# reset_password
	def restore(id, image), do:
	# resize
	def rebuild(id, image), do:
	def snapshot(id, name), do:
	def rename(id, name), do:

	# change_kernel
	# enable_ipv6
	# enable_pnetwork

	defp url(id), do: "droplets/#{id}/actions"
end
