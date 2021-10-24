defmodule NlwHeatTagsWeb.Router do
  use NlwHeatTagsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NlwHeatTagsWeb do
    pipe_through :api

    post "/messages", MessagesController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: NlwHeatTagsWeb.Telemetry
    end
  end

  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
