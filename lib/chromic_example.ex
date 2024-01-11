defmodule ChromicExample do
  @moduledoc """
  Documentation for `ChromicExample`.
  """

  @doc """
  Test function that leads into a Chromium error.

  ## Examples

      iex> ChromicExample.test()
      :world

  """
  def test do
    content =
      "test.html"
      |> ChromicExample.ViewExample.render()
      |> Phoenix.HTML.safe_to_string()

    ChromicPDF.Template.source_and_options(content: content, size: :a4)
    |> ChromicPDF.print_to_pdf(output: "test.pdf")
  end
end
