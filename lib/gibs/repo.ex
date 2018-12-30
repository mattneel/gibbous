defmodule Gibs.Repo do
  use Ecto.Repo,
    otp_app: :gibs,
    adapter: Ecto.Adapters.Postgres
end
