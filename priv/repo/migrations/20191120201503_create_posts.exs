defmodule Legends.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :description, :string
      add :body, :string
      add :chapter, :integer
      add :sort_order, :integer
      add :start_date, :date
      add :end_date, :date
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:posts, [:user_id])
  end
end
