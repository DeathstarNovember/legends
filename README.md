# Legends

## Requirements

- [Node.js](https://nodejs.org/en) (v8+)
- [Elixir](https://elixir-lang.org/install.html) (v1.6+)
- [Yarn](https://yarnpkg.com/en/docs/install) - optional. You can use `npm` if you want, but it's for your own sanity.

## Getting started

To install dependencies and configure your project:

- Install Elixir dependencies with `mix deps.get`.
- `cd` to the `assets/` directory and run `yarn` (or `npm install`) to install Node.js dependencies.
- Modify the database settings in each `config/` files according to your needs.
- Create and migrate your database with `mix ecto.setup` (this runs `mix ecto.create`, `mix ecto.migrate` and `mix run priv/repo/seeds.exs` in order)

To start your Phoenix server:

- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check out the deployment guides provided by Phoenix](http://www.phoenixframework.org/docs/deployment).

## Learn more

- Official website: http://www.phoenixframework.org/
- Guides: http://phoenixframework.org/docs/overview
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix
