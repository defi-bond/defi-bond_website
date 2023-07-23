# defi_bond_website

## Netlify Deployment

1. Build app.
```
$ flutter clean
$ flutter build web --web-renderer html --release
```

2. Create netlify.toml in build/web.
```toml
[[redirects]]
  from = "/.well-known/assetlinks.json"
  to = "/assets/well-known/assetlinks.json"
  status = 200
  force = true # COMMENT: ensure that we always redirect
  headers = {X-From = "Netlify"}
```

3. Drag and drop build/web into Netlify's Deploys tab.
