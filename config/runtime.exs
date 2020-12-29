import Config

if config_env() == :prod do
  config :dashboard, :client_url, System.fetch_env!("TASKID_CLIENT_URL")

  # database_url =
  #   System.get_env("DATABASE_URL") ||
  #     raise """
  #     environment variable DATABASE_URL is missing.
  #     For example: ecto://USER:PASS@HOST/DATABASE
  #     """
  #
  # config :dashboard, Dashboard.Repo,
  #   # ssl: true,
  #   url: database_url,
  #   pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

  config :dashboard, DashboardWeb.Endpoint,
    server: true,
    http: [
      port: String.to_integer(System.fetch_env!("TASKID_PORT")),
      transport_options: [socket_opts: [:inet6]]
    ],
    secret_key_base: System.fetch_env!("TASKID_SECRET_KEY_BASE")
end
