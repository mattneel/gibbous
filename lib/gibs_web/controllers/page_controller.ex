defmodule GibsWeb.PageController do
  use GibsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
