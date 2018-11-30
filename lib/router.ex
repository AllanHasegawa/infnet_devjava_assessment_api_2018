defmodule Router do
  @moduledoc false
  use Plug.Router
  require Logger

  plug(:match)
  plug(:dispatch)

  get("/tasks", do: handle_get_tasks(conn))
  match(_, do: handle_unknown_route(conn))

  defp handle_unknown_route(conn), do: send_resp(conn, 404, "Oops!")

  defp handle_get_tasks(conn) do
    maybe_auth = find_authorization_header(conn.req_headers)

    case auth_valid?(maybe_auth) do
      true -> put_resp_content_type(conn, "application/json")
              |> send_resp(200, tasks_json())
      false -> send_resp(conn, 401, "Unauthenticated")
    end
  end

  defp tasks_json do
    tasks = TasksMother.generate_random_tasks()
    response = %{:tasks => tasks, :status => "ok"}
    Jason.encode!(response)
  end

  defp auth_valid?(auth) do
    case auth do
      nil -> false
      _ -> String.length(auth) > 5
    end
  end

  defp find_authorization_header(headers) do
    maybe_auth = headers
                 |> Enum.filter(&auth_header?/1)
                 |> Enum.at(0, :none)
    case maybe_auth do
      :none -> nil
      _ -> elem(maybe_auth, 1)
    end
  end

  defp auth_header?({key, _}) do
    String.downcase(key) == "authorization"
  end
end
