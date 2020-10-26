defmodule UploaderS3.Repo do
  use Ecto.Repo,
    otp_app: :uploaderS3,
    adapter: Ecto.Adapters.Postgres
end
