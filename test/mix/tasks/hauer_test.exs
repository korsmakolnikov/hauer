defmodule Mix.Tasks.HauerTest do
  use ExUnit.Case

  setup do
    Mix.shell(Mix.Shell.Process)
    conf = Hauer.Configuration.read

    on_exit fn ->
      Mix.shell(Mix.Shell.IO)
      Hauer.Configuration.write(conf)
      File.rm_rf("lib/middleware")
    end

    :ok
  end

  test "create resource" do
    resource_name = "qwerty"
    Mix.Tasks.Hauer.run(["resource", resource_name])

    conf = Hauer.Configuration.read

    assert Enum.any?(conf[:resources], fn(resource) ->
      Map.has_key?(resource, String.to_atom(resource_name))
    end)

    assert File.exists?("lib/middleware/#{resource_name}.ex")

    assert 0 < File.read!("lib/middleware/#{resource_name}.ex") |> String.length

    on_exit fn ->
      File.rm_rf Hauer.FS.get_resource_dir(resource_name)
    end
  end
end
