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

  def get(id) do
    {:atomic, results} =
      Mnesia.transaction(fn ->
        Mnesia.read({Services, id})
      end)

    case results do
      [] -> nil
      [record] -> Service.from_record(record)
    end
  end

  def get_all() do
    {:atomic, services} =
      Mnesia.transaction(fn ->
        Mnesia.all_keys(Services)
      end)

    services
    |> Enum.filter(&(!is_nil(&1)))
    |> Enum.map(&get/1)
  end
end
