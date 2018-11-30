defmodule TodoTask do
  @moduledoc false

  @derive Jason.Encoder
  defstruct id: nil, created_at: nil, description: nil, done: nil
end
