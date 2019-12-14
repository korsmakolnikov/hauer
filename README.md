# Important

This project isn't yet released. Give us the time to finish it, or if you want, help us. We need your support if you are an Elixir developer.

# Hauer

Hauer is a super simple web framework. It's born to simplify web development and leave boring things to abstractions, while it let the full power of Elixir in the hands of developers. You have just to unleash it when you need it. Otherwise use its command line utility to build endpoints and proxies or use its DSL as a glue between your microservices.
Hauer isn't a webframework in the way Phoenix is. Isn't build to reply to calls with web pages. Its business is build fast, little APIs.

Hauer it's built upon Plug.

## Mission

Hauer's way is to automate the "boring part" of web services development and leave developers dealing with business logic, the "fun part". 
Hauer's mission is giving a fast & easy developer experience without precluding any level of complexity.

## How it works

You can deal with your project's internals as you want: the work inside Hauer starts from a simple Elixir module with pure functions. You'll get calls arguments as input, output what you want through what you need. Under these simple functions you can rely on the immense power of powerful Elixir ecosystem libraries, like OTP. 
Shaping your APIs is done by *Roy*, Hauer's DSL. Roy differs from swagger or proto because it will generate your code. In the simplest case Roy will generate a module per resources with a method per http verb. But Roy can do simple crud operation alone and also can built simple tranformation pipelines. You can fetch what you need, proxy to other services and add as a pipeline step pure Elixir functions to transform your data. Think Roy is a "glue" (and also a map, because it is very readable) between all your piece of logic.
Using Roy is fun, and leave your work inside pure functions. Pure functions are easy to read and easy to test. 

In alternative, you can use `hauer` command line utility. It gives you simple commands to build Roy pipelines without even learn its syntax. Thanks to `hauer` utility you can start to work with Hauer knowing just Elixir and Http princeples.

## Workflow

With Roy you can think working with Hauer as a series of steps:

* Describing your APIs (Coding with Roy language) 
* Generate Elixir scaffold from Roy code
* Fill empty steps with business logic (Coding pure Elixir) 

If you want avoid Roy language you can with `hauer` command line utility:

* Describing your APIs (Generate Roy code with hauer utility) 
* Generate Elixir scaffold from Roy code
* Fill empty steps with business logic (Coding pure Elixir)

## Roy's syntax

to do with friends.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hauer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hauer, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/hauer](https://hexdocs.pm/hauer).

## About the name

We started Hauer development the night Rutger Hauer die. We all think he was a great actor, we like all of his films and of course we'll never forget his iconic role of Roy Betty. We thought the best we could do to remember such a great man was to give his name to the project.

Thank you Rutger for all your films.
