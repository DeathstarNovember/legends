defmodule LegendsWeb.Schema.StoryTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Legends.Repo

  alias LegendsWeb.Resolvers


  @desc "Post object"
  object :post do
    field :id, :id
    field :body, :string
    field :chapter, :integer
    field :description, :string
    field :end_date, :date
    field :sort_order, :integer
    field :start_date, :date
    field :title, :string
    field :user, :user, resolve: assoc(:user)
  end

  object :story_queries do
    @desc "Get all posts"
    field :list_posts, list_of(:post) do
      resolve(&Resolvers.StoriesResolver.list_posts/3)
    end

    @desc "Get a post"
    field :get_post, :post do
      arg(:id, non_null(:id))
      resolve(&Resolvers.StoriesResolver.get_post/3)
    end
  end

  object :story_mutations do
    @desc "Create a post"
    field :create_post, :post do
    arg(:sort_order, non_null(:integer))
    arg(:user_id, non_null(:id))
    arg(:title, :string)
    arg(:body, non_null(:string))
    arg(:description, :string)
    arg(:chapter, :integer)
    arg(:end_date, :date)
    arg(:start_date, :date)

      resolve(&Resolvers.StoriesResolver.create_post/3)
    end

    @desc "Update a post"
    field :update_post, :post do
      arg(:id, non_null(:id))
      arg(:sort_order, non_null(:integer))
      arg(:user_id, non_null(:id))
      arg(:title, :string)
      arg(:body, non_null(:string))
      arg(:description, :string)
      arg(:chapter, :integer)
      arg(:end_date, :date)
      arg(:start_date, :date)

      resolve(&Resolvers.StoriesResolver.update_post/3)
    end

    @desc "Delete a post"
    field :delete_post, :id do
      arg(:id, non_null(:id))

      resolve(&Resolvers.StoriesResolver.delete_post/3)
    end
  end

  object :story_subscriptions do
    @desc "Populate new posts"
    field :post_created, :post do
      config(fn _, _ ->
        {:ok, topic: "posts"}
      end)

      trigger(:create_post,
        topic: fn _ ->
          "posts"
        end
      )
    end
  end
end
