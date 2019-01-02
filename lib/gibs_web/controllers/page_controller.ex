defmodule GibsWeb.PageController do
  use GibsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def dashboard(conn, _params) do
    render(conn, "dashboard.html")
  end

  def healthy(conn, _params) do
    send_resp(conn, 200, "")
  end
end
