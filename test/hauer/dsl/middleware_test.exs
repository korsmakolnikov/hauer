
defmodule MiddlewareTest do
  use ExUnit.Case

  alias Hauer.Dsl.Middleware

  test "create method" do
    method = Middleware.generate_method("test")
    assert "def test_action(), do: :ok" == method
  end

  test "create methods" do 
    methods = Middleware.generate_methods()
    assert nil != methods
    assert is_bitstring(methods)
  end

  test "create module" do 
    module = Middleware.generate_module("test")
    assert nil != module
    assert is_bitstring(module)
    assert module |> String.match?(~r/Test/)
  end
end
