defmodule ChromicExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {ChromicPDF, chromic_pdf_opts()}
      # Starts a worker by calling: ChromicExample.Worker.start_link(arg)
      # {ChromicExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChromicExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp chromic_pdf_opts, do: Application.fetch_env!(:chromic_example, ChromicPDF)
end
