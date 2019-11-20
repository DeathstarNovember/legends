defmodule Legends.Repo do
  use Ecto.Repo,
    otp_app: :legends,
    adapter: Ecto.Adapters.Postgres
end
