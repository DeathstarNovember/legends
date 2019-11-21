defmodule LegendsWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(LegendsWeb.Schema.AccountTypes)
  import_types(LegendsWeb.Schema.StoryTypes)

  query do
    import_fields(:account_queries)
    import_fields(:story_queries)
  end

  mutation do
    import_fields(:account_mutations)
    import_fields(:story_mutations)
  end

  subscription do
    import_fields(:account_subscriptions)
    import_fields(:story_subscriptions)
  end
end
