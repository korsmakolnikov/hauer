defmodule Hauer.FS.FSTest do
  use ExUnit.Case

  @resource_name "vQJ1pEUiAMr5NklN77C4" # to avoid collision with existent resources

  test "create and delete a resource" do
    {:ok, file_path} = Hauer.FS.add_resource(@resource_name, "")
    assert String.contains?(file_path, "#{@resource_name}.ex")

    assert Hauer.FS.remove_resource(@resource_name) == :ok
  end

  test "return an error when the resource already exists" do
    {:ok, file_path} = Hauer.FS.add_resource(@resource_name, "")
    {:error, message} = Hauer.FS.add_resource(@resource_name, "")

    assert String.contains?(message, "Resource file already exists")

    on_exit fn ->
      File.rm_rf Path.dirname(file_path)
    end
  end
end
