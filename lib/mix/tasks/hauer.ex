defmodule Mix.Tasks.Hauer do
  use Mix.Task

  alias Hauer.Dsl.Middleware
  alias Hauer.FS
  alias Hauer.Configuration

  @moduledoc """
  Hauer's Mix task.
  """

  defp resource_info(resource_name) do
    """
    The #{resource_name} resource was created.
    The module lib/middleware/#{resource_name} contains middleware methods
    boundled to the route [your_app]/#{resource_name}

    Fill those methods with your business logic and be happy, Dave.
    """
  end

  defp create_resource(resource_name) do
    module_content = Middleware.generate_module(resource_name)
    FS.add_resource(resource_name, module_content)
  end

  @impl Mix.Task
  @shortdoc "Scaffold a new route"
  def run(args) do
    Mix.shell().info("Hauer command line 1.0")

    verb = args |> Enum.at(0)
    resource_name = args |> Enum.at(1)

    case verb do
      "resource" ->
        case create_resource(resource_name) do
          {:ok, _} -> 
            resource_name |> resource_info |> Mix.shell().info
            Configuration.add_resource(resource_name)
            
          {:error, message} -> 
            Mix.shell().error(message)
        end
      _ ->
        Mix.shell().info("I'm afraid I can't do that, Dave.")
    end

    Mix.shell().info("All done.")
  end
end
