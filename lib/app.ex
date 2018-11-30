defmodule App do
  @moduledoc false
  use Application
  require Logger

  defp cowboy_port, do:
    Application.get_env(:infnet_devjava_assessment_ap, :cowboy_port, 80)

  def start(_type, _args) do
    children = [
      {
        Plug.Cowboy,
        scheme: :http,
        plug: Router,
        options: [
          port: cowboy_port()
        ]
      }
    ]
    opts = [strategy: :one_for_one, name: Api.Supervisor]

    Logger.info("Starting application at port #{cowboy_port()} in #{Mix.env()}...")

    Supervisor.start_link(children, opts)
  end

end
