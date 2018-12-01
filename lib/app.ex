defmodule App do
  @moduledoc false
  use Application
  require Logger

  defp cowboy_port do
    with {port, _} <- Integer.parse(System.get_env("PORT"))
      do
      port
    else
      _ -> Application.get_env(:infnet_devjava_assessment_api, :cowboy_port, 8080)
    end
  end

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
