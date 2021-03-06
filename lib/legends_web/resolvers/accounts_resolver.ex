defmodule LegendsWeb.Resolvers.AccountsResolver do
  alias Legends.Accounts

  def get_user(_parent, args, _resolutions) do
    {:ok, Accounts.get_user!(args[:id])}
  end

  def list_users(_parent, _args, _resolutions) do
    {:ok, Accounts.list_users()}
  end

  def create_user(_parent, args, _resolutions) do
    args
    |> Accounts.create_user()
    |> case do
      {:ok, user} ->
        {:ok, user}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_user(_parent, args, _resolutions) do
    Accounts.get_user!(args[:id])
    |> Accounts.update_user(args)
    |> case do
      {:ok, user} ->
        {:ok, user}
      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def delete_user(_parent, args, _resolutions) do
    args[:id]
    |> Accounts.delete_user()
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
