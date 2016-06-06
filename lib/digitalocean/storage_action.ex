defmodule DigitalOcean.Storage.Action do
	@moduledoc """
	API methods for interacting with the `Block Storage Action` module.

	See the [Block Storage Action Reference](https://developers.digitalocean.com/documentation/v2/#block-storage-actions).
	"""

	@doc """
	Attach a Block Storage volume to a Droplet by its `id` and `region` pair.
	"""
	def attach_by_id(vol_id, vol_region, drop_id) do
		handle_id("attach", vol_id, vol_region, drop_id)
	end

	@doc """
	Similar to `attach_by_id/3` but returns the response body only.
	"""
	def attach_by_id!(vol_id, vol_region, drop_id) do
		attach_by_id(vol_id, vol_region, drop_id) |> body
	end

	@doc """
	Attach a Block Storage volume to a Droplet by its `name` and `region` pair.
	"""
	def attach_by_name(vol_name, vol_region, drop_id) do
		handle_name("attach", vol_name, vol_region, drop_id)
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
		handle_id("detach", vol_id, vol_region, drop_id)
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
		handle_name("detach", vol_name, vol_region, drop_id)
	end

	@doc """
	Similar to `detach_by_name/3` but returns the response body only.
	"""
	def detach_by_name!(vol_name, vol_region, drop_id) do
		detach_by_name(vol_name, vol_region, drop_id) |> body
	end

	defp put_type(map, type), do: Map.put(map, :type, "type")

	defp gen_map(region, drop_id), do: %{region: region, droplet_id: drop_id}
	defp gen_map(name, region, drop_id), do: gen_map(region, drop_id) |> Map.put(:volume_name, name)

	defp handle_id(type, vol_id, vol_region, drop_id) do
		post("volumes/#{vol_id}/actions", gen_map(vol_region, drop_id) |> put_type(type))
	end

	defp handle_name(type, vol_name, vol_region, drop_id) do
		post("volumes/actions", gen_map(vol_name, vol_region, drop_id) |> put_type(type))
	end
end
