defmodule LegendsWeb.Resolvers.StoriesResolver do
  alias Legends.Stories

  def get_post(_parent, args, _resolutions) do
    {:ok, Stories.get_post!(args[:id])}
  end

  def list_posts(_parent, _args, _resolutions) do
    {:ok, Stories.list_posts()}
  end

  def create_post(_parent, args, _resolutions) do
    args
    |> Stories.create_post()
    |> case do
      {:ok, post} ->
        {:ok, post}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_post(_parent, args, _resolutions) do
    Stories.get_post!(args[:id])
    |> Stories.update_post(args)
    |> case do
      {:ok, post} ->
        {:ok, post}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def delete_post(_parent, args, _resolutions) do
    args[:id]
    |> Stories.delete_post()
    {:ok, :id}
  end

  defp extract_error_msg(changeset) do
    changeset.errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error)
      ]
    end)
  end

end
