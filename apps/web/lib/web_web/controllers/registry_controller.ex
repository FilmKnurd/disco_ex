defmodule WebWeb.RegistryController do
  require Logger
  use WebWeb, :controller

  alias Phoenix.LiveView
  alias Web.RegistryContext

  def dashboard(conn, attrs) do
    LiveView.Controller.live_render(conn, WebWeb.DashboardView, session: %{})
  end

  def register_service(conn, %{"data" => data}) do
    RegistryContext.register(data)
  end

  def unregister_service(conn, %{"id" => id}) do
  end

  def renew_service(conn, %{"id" => id}) do
  end

  def find_service(conn, attrs) do
    params = Params.to_attributes(attrs)
  end

  def bind_service(conn, %{"source_reg_id" => source_reg_id, "target_reg_id" => target_reg_id}) do
  end
end
