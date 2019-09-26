defmodule Web.RegistryContext.RegistryEntry do
  defstruct url: "",
            name: "",
            request_media_type: "",
            response_media_type: "",
            health_url: "",
            health_ttl: "",
            renewal_ttl: "",
            tags: ""
end
