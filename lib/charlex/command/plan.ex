defmodule Charlex.Command.Plan do
  use Charlex.Command

  @impl true
  def usage() do
    """
    <prefix> !plan

    """
  end

  @impl true
  def description() do
    """
    Will output the famous Charles phrase, THIS IS THE GREATEST PLAAAAN
    """
  end

  @impl true
  def run(context, _args) do
    Nostrum.Api.create_message(
      context.message.channel_id,
      "THIS IS THE GREATEST PLAAAAAAAN"
    )
  end
end
