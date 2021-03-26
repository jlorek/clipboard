# Clipboard

## Gigalixir Hosting

```
gigalixir login
gigalixir pg:create --free -a rinder
gigalixir git:remote rinder
gigalixir stack:set --stack gigalixir-20
git push --set-upstream gigalixir master
gigalixir run mix ecto.migrate

# in case of errors like...
# gigalixir remote: cp: cannot overwrite directory
# https://gigalixir.readthedocs.io/en/latest/deploy.html#how-to-clean-your-build-cache
# git -c http.extraheader="GIGALIXIR-CLEAN: true" push gigalixir master
```

### Local Development

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).