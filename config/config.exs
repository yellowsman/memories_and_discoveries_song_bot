import Config

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

config :google_drive,
  client_id: System.get_env("MAD_GOOGLE_DRIVE_API_ID"),
  api_key: System.get_env("MAD_GOOGLE_DRIVE_API_KEY")
