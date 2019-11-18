defmodule Hauer.Dsl.Resource do
  @moduledoc """
  Resource wrapper that takes defined resources and generates code
  """

  alias Hauer.Configuration

  @resources_dir Application.get_env(:hauer, :resources_dir)

  defmacro map_resources([]) do
    quote do
      raise "You must define at list a route"
    end
  end

  defmacro map_resources() do
    parsed = Configuration.read()
    resources = Configuration.parse_conf(parsed[:resources])

    for r <- resources do
      module = Atom.to_string(r)
      quote do
        get "/#{unquote(module)}" do
          send_resp(var!(conn), 200, apply(:"Hauer.#{unquote(@resources_dir)}.#{unquote(module)}", :get, []))
        end
      end
    end
  end
end
