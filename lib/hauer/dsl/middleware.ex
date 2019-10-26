defmodule Hauer.Dsl.Middleware do
  @moduledoc """
  This module scaffold middleware.
  Do not use macro to generate code.
  """

  @verbs ["get", "post", "head", "put", "delete", "patch"]

  def generate_module(module_name) when is_bitstring(module_name) do
    open_module(module_name) <> generate_methods() <> close_block()
      |> Code.format_string!
      |> Enum.join
  end

  def generate_module(_), do: raise "Dave, I need a name (string) to build the module name!"
  def generate_module, do: raise "Dave, I need a name (string) to build the module name!"

  def open_module(module_name) do
    capitalized_module_name = String.capitalize module_name
    "defmodule #{capitalized_module_name} do\n"
  end

  def close_block do
    "\nend\n"
  end

  def generate_methods do
    methods_list = for method_name <- @verbs do
      generate_method(method_name)
    end

    Enum.join(methods_list, "\n")
  end
  
  def generate_method(method_name) when is_bitstring(method_name) do
    mn = "#{method_name}_action"
    "def #{mn}(), do: :ok"
  end

  def generate_method(_), do: raise "Dave, I need a name (string) to build method name!"
  def generate_method, do: raise "Dave, I need a name (string) to build method name!"
end
