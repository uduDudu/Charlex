defmodule Charlex.Consumer do
  use Nostrum.Consumer
  require Logger

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, %{author: %{bot: bot}} = msg, _ws_state}) when bot != true do
    Charlex.Handler.handle_message(msg)
  end

  def handle_event({:READY, _msg, _ws_state}) do
    alias Charlex.Command

    %{
      "pet" => Command.Pet,
      "profile" => Command.Profile,
      "plan" => Command.Plan,
      "distract" => Command.Distract,
      "padoru" => Command.Padoru,
      "dnd" => Command.Dnd,
      "help" => Command.Help
    }
    |> Charlex.put_commands()

    Charlex.fetch_owner()
  end

  def handle_event(_), do: :noop
end
