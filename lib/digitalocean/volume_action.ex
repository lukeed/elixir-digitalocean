defmodule DigitalOcean.Volume.Action do
	@moduledoc """
	API methods for interacting with the `Block Storage Action` module.

	See the [Block Storage Action Reference](https://developers.digitalocean.com/documentation/v2/#block-storage-actions).
	"""

	@doc """
	List all actions for a Volume.
	"""
	def list(vol_id), do: get("volumes/#{vol_id}/actions")

	@doc """
	Similar to `list/1` but returns the response body only.
	"""
	def list!(vol_id), do: list(vol_id) |> body

	@doc """
	Get info for a Volume action.
	"""
	def show(vol_id, act_id), do: get("volumes/#{vol_id}/actions/#{act_id}")

	@doc """
	Similar to `show/2` but returns the response body only.
	"""
	def show!(vol_id, act_id), do: show(vol_id, act_id) |> body

	@doc """
	Attach a Volume to a Droplet by its `id` and `region` pair.
	"""
	def attach_by_id(vol_id, vol_region, drop_id) do
		send_post("attach", vol_id, %{region: vol_region, droplet_id: drop_id})
	end

	@doc """
	Similar to `attach_by_id/3` but returns the response body only.
	"""
	def attach_by_id!(vol_id, vol_region, drop_id) do
		attach_by_id(vol_id, vol_region, drop_id) |> body
	end

	@doc """
	Attach a Volume to a Droplet by its `name` and `region` pair.
	"""
	def attach_by_name(vol_name, vol_region, drop_id) do
		send_post("attach", %{name: vol_name, region: vol_region, droplet_id: drop_id})
	end

	@doc """
	Similar to `attach_by_name/3` but returns the response body only.
	"""
	def attach_by_name!(vol_name, vol_region, drop_id) do
		attach_by_name(vol_name, vol_region, drop_id) |> body
	end

	@doc """
	Detach a Volume from a Droplet by its `id` and `region` pair.
	"""
	def detach_by_id(vol_id, vol_region, drop_id) do
		send_post("detach", vol_id, %{region: vol_region, droplet_id: drop_id})
	end

	@doc """
	Similar to `detach_by_id/3` but returns the response body only.
	"""
	def detach_by_id!(vol_id, vol_region, drop_id) do
		detach_by_id(vol_id, vol_region, drop_id) |> body
	end

	@doc """
	Detach a Volume from a Droplet by its `name` and `region` pair.
	"""
	def detach_by_name(vol_name, vol_region, drop_id) do
		send_post("detach", %{name: vol_name, region: vol_region, droplet_id: drop_id})
	end

	@doc """
	Similar to `detach_by_name/3` but returns the response body only.
	"""
	def detach_by_name!(vol_name, vol_region, drop_id) do
		detach_by_name(vol_name, vol_region, drop_id) |> body
	end

	@doc """
	Resize a Volume storage.
	"""
	def resize(vol_id, vol_region, size) do
		send_post("resize", vol_id, %{region: vol_region, size_gigabytes: size})
	end

	defp merge(map, type), do: Map.put(map, :type, type)
	defp send_post(type, vol_map), do: post("volumes/actions", merge(vol_map, type))
	defp send_post(type, vol_id, vol_map), do: post("volumes/#{vol_id}/actions", merge(vol_map, type))
end
