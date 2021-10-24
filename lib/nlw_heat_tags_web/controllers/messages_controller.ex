defmodule NlwHeatTagsWeb.MessagesController do
  use NlwHeatTagsWeb, :controller

  def create(conn, params) do
    conn
    |> put_status(:ok)
    |> json(%{message: params})
  end
end
