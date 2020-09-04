defmodule Charlex.Command do
  @callback usage() :: [String.t()]

  @callback description() :: String.t()

  @callback parse_args(args :: String.t()) :: any()

  @callback run(context :: Map.t(), args :: [String.t()] | any()) :: String.t() | any()

  defmacro __using__(_opts) do
    quote do
      @behavior unquote(__MODULE__)

      @impl true
      def usage, do: []

      @impl true
      def description, do: []

      @impl true
      def run(_context, _args), do: :ok

      @impl true
      def parse_args(args), do: String.split(args)
    end
  end
end
