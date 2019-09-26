defmodule ServiceRegistry do
  @moduledoc """
  Open DISCO Service Registry.
  """

  alias :mnesia, as: Mnesia
  alias ServiceRegistry.Service

  def register(%Service{} = service) do
    service = %Service{service | registryID: UUID.uuid4()}

    result =
      Mnesia.transaction(fn ->
        service
        |> Service.to_record()
        |> Mnesia.write()
      end)

    service
  end

  def unregister(id) do
    Mnesia.transaction(fn ->
      Mnesia.delete({Services, id})
    end)
  end

  def renew(id) do
  end

  def find() do
  end

  def bind(id) do
  end
end
