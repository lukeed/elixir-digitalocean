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

	# reset_password
	# def restore(id, image), do:
	# # resize
	# def rebuild(id, image), do:
	# def snapshot(id, name), do:
	# def rename(id, name), do:
	# change_kernel

	# simple POST methods
	["enable_backups", "disable_backups", "reboot", "shutdown",
	 "power_cycle", "power_off", "power_on", "enable_ipv6",
	 "enable_private_networking"]
	 	|> Enum.each(fn evt ->
			def unquote(:"#{evt}")(id), do: url(id) |> post(%{type: unquote(evt)}) |> full
			def unquote(:"#{evt}!")(id), do: unquote(:"#{evt}")(id) |> body
		end)

	defp url(id), do: "droplets/#{id}/actions"
end
