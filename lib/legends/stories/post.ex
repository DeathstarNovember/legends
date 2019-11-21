defmodule Legends.Stories.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Legends.Accounts.User

  schema "posts" do
    field :body, :string
    field :chapter, :integer
    field :description, :string
    field :end_date, :date
    field :sort_order, :integer
    field :start_date, :date
    field :title, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :body, :chapter, :sort_order, :start_date, :end_date])
    |> validate_required([:title, :description, :body, :chapter, :sort_order, :start_date, :end_date])
  end
end
