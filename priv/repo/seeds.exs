defmodule Legends.DatabaseSeeder do
  @moduledoc """
  Script for populating the database. You can run it as:

      mix run priv/repo/seeds.exs

  Inside the script, you can read and write to any of your
  repositories directly:

      Legends.Repo.insert!(%Legends.SomeSchema{})

  We recommend using the bang functions (`insert!`, `update!`
  and so on) as they will fail if something goes wrong.
  """
  alias Legends.Repo
  alias Legends.Accounts.User

  Repo.insert!(%User{name: "John Hill", email: "example@email.com"})


end
