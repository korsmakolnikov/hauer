defmodule Hauer.Router do
  use Plug.Router

  require Hauer.Dsl.Resource
  alias Hauer.Dsl.Resource

  plug(:match)
  plug(:dispatch)

  get "/healt-check" do
    conn |> send_resp(200, ":ok")
  end

  Resource.map_resources(conn)

  match _ do
    send_resp(conn, 404, "Yikes! 404")
  end

  def start_link do
    Plug.Adapters.Cowboy2.http(__MODULE__, [])
  end
end
