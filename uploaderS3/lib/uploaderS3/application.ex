defmodule UploaderS3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UploaderS3.Repo,
      # Start the Telemetry supervisor
      UploaderS3Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: UploaderS3.PubSub},
      # Start the Endpoint (http/https)
      UploaderS3Web.Endpoint
      # Start a worker by calling: UploaderS3.Worker.start_link(arg)
      # {UploaderS3.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UploaderS3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UploaderS3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
