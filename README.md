# Clipboard 🚀🚀

## Gigalixir Hosting

```
gigalixir apps:create --name clipboard --cloud gcp --region europe-west1 --stack gigalixir-20
gigalixir pg:create --free --app_name clipboard
git push --set-upstream gigalixir main
```

```
# add remote for already created app
gigalixir git:remote clipboard
# change used stack
gigalixir stack:set --stack gigalixir-20
# run pending migrations
gigalixir run mix ecto.migrate
```

```
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