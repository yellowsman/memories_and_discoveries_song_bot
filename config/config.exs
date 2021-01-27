import Config

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

config :goth,
  json: {:system, "GCP_CREDENTIALS"},
  disabled: true
