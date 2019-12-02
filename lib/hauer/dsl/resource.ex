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

  defmacro map_resources(conn) do
    parsed = Configuration.read()
    resources = Configuration.parse_conf(parsed[:resources])

    for r <- resources do
      slug = Atom.to_string(r)
      namespace = String.capitalize(@resources_dir)
      module = String.capitalize(slug)

      for verb <- ["get", "post", "put", "delete", "patch"] do
        quote do
          match "/#{unquote(slug)}", via: String.to_atom(unquote(verb)) do
            response = :"Elixir.Hauer.#{unquote(namespace)}.#{unquote(module)}".get_action()
            send_resp(var!(conn), 200, response)
          end
        end
      end 
    end
  end
end
