defmodule LegendsWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Legends.Repo

  alias LegendsWeb.Resolvers


  @desc "User object"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  object :account_queries do
    @desc "Get all users"
    field :list_users, list_of(:user) do
      resolve(&Resolvers.AccountsResolver.list_users/3)
    end

    @desc "Get a user"
    field :get_user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.AccountsResolver.get_user/3)
    end
  end

  object :account_mutations do
    @desc "Create a user"
    field :create_user, :user do
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))

      resolve(&Resolvers.AccountsResolver.create_user/3)
    end

    @desc "Update a user"
    field :update_user, :user do
      arg(:id, non_null(:id))
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))

      resolve(&Resolvers.AccountsResolver.update_user/3)
    end

    @desc "Delete a User"
    field :delete_user, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.AccountsResolver.delete_user/3)
    end
  end

  object :account_subscriptions do
    @desc "Populate new users"
    field :user_created, :user do
      config(fn _, _ ->
        {:ok, topic: "users"}
      end)

      trigger(:create_user,
        topic: fn _ ->
          "users"
        end
      )
    end
  end
end
