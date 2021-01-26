defmodule MemoriesAndDiscoveriesSongBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :memories_and_discoveries_song_bot,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:quinn, "~> 1.1.3"},
      {:mojiex, github: "enpedasi/mojiex"},
      {:tz, "~> 0.12.0"},
      {:google_api_drive, "~> 0.20"},
      {:goth, "~> 1.2.0"}
    ]
  end
end
