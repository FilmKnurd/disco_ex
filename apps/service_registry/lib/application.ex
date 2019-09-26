defmodule ServiceRegistry.Application do
  use Application

  alias :mnesia, as: Mnesia

  def start(_type, _args) do
    Mnesia.create_schema([node()])

    Mnesia.start()

    Mnesia.create_table(Services,
      attributes: [
        :registryID,
        # URL of service
        :serviceURL,
        # text name of service, non-unique
        :serviceName,
        # space separated lists of filter tag words
        :tags,
        # current status of service [up, down, unknown
        :status,
        # space separated list of profile URIs
        :profile,
        # space separated list of mediaType identifiers
        :mediaType,
        # URL to use when sending health-check pings
        :healthURL,
        # time-to-live (in seconds) for a valid health-check response
        :healthTTL,
        # last date/time registry receigved a ping from the service
        :healthLast,
        # count (estimate) of clients using this service
        :bindCount,
        # URL to use when renewing the registry entry
        :renewURL,
        # time-to-live (in seconds) for a valid renewal
        :renewTTL,
        # last date/time of successful renewal
        :renewLast
      ]
    )

    # List all child processes to be supervised
    children = []

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Web.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
