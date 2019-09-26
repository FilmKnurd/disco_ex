defmodule Web.RegistryContext do
  alias ServiceRegistry.Service

  def register(%Service{} = registry_entry) do
    :ok
  end

  def unregister(id) do
  end

  def renew(id) do
  end

  def find_service() do
  end
end
