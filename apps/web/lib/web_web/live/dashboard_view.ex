defmodule WebWeb.DashboardView do
  use Phoenix.LiveView
  alias ServiceRegistry

  def render(assigns) do
    ~L"""
    <div class="">
      <div>
        <div>Name: <%= @services.serviceName %></div>
        <div>Service URL: <%= @services.serviceURL %></div>
        <div>Tags: <%= @services.tags %></div>
        <div>Health Last: <%= @services.healthLast %></div>
        <div>Health TTL: <%= @services.healthTTL %></div>
        <div>Health URL: <%= @services.healthURL %></div>
        <div>Media Type: <%= @services.mediaType %></div>
        <div>Profile: <%= @services.profile %></div>
        <div>Registry ID: <%= @services.registryID %></div>
        <div>Renew Last: <%= @services.renewLast %></div>
        <div>Renew TTL: <%= @services.renewTTL %></div>
      </div>
    </div>
    """
  end

  def mount(_session, socket) do
    services = ServiceRegistry.get_all()
    services = Enum.at(services, 0)
    {:ok, assign(socket, services: services)}
  end
end
