defmodule Legends.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Legends.Stories.Post


  schema "users" do
    field :email, :string
    field :name, :string
    has_many :posts, Post

    timestamps()
  end

  @doc false
  @required_fields ~w( name email )a
  @optional_fields ~w( )a
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
