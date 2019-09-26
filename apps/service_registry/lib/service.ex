defmodule ServiceRegistry.Service do
  @moduledoc """
  Service Record
  """
  @enforce_keys [:serviceName, :serviceURL]

  defstruct [
    # unique registry id of the service
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

  def to_record(%__MODULE__{} = service) do
    {Services, service.registryID, service.serviceURL, service.serviceName, service.tags,
     service.status, service.profile, service.mediaType, service.healthURL, service.healthTTL,
     service.healthLast, service.bindCount, service.renewURL, service.renewTTL, service.renewLast}
  end

  def from_record(record) do
    %__MODULE__{
      registryID: elem(record, 1),
      serviceURL: elem(record, 2),
      serviceName: elem(record, 3),
      tags: elem(record, 4),
      status: elem(record, 5),
      profile: elem(record, 6),
      mediaType: elem(record, 7),
      healthURL: elem(record, 8),
      healthTTL: elem(record, 9),
      healthLast: elem(record, 10),
      bindCount: elem(record, 11),
      renewURL: elem(record, 12),
      renewTTL: elem(record, 13),
      renewLast: elem(record, 14)
    }
  end
end
