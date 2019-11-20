defmodule LegendsWeb.PageController do
  use LegendsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
