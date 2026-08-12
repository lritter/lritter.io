# lritter.io

Source for **lritter.io**, an [omg.lol](https://omg.lol) address served by
[weblog.lol](https://weblog.lol). Three separate surfaces are published from
this one repo:

| Surface | Lives at | Source | Deployed by |
|---|---|---|---|
| **Weblog** (landing page, pages, posts) | `lritter.io` | `weblog/`, `configuration/` | `neatnik/weblog.lol@v1` Action |
| **Now page** | `lritter.omg.lol/now` | `now/now.md` | `script/deploy-now.sh` → omg.lol API |
| **Profile** (h-card) | `lritter.omg.lol` | `web/` | `script/deploy-web.sh` → omg.lol API |

## Deploy model

`.github/workflows/main.yml` runs on every push to any branch. Deploys come
from whatever ref you push (merge to `main` for the canonical site). There is
**no local deploy** — the omg.lol API key lives only in the `WEBLOG_API_KEY`
GitHub secret, so verify changes by curling the live URLs after the Action runs.

The Action does three things:
1. **weblog import** — syncs `weblog/` pages/posts and `configuration/` to the weblog.
2. **`deploy-now.sh`** — pushes `now/now.md` to the now page.
3. **`deploy-web.sh`** — pushes `web/` to the profile page.

### Deploy triggers

- The now page deploys when `now/now.md` changed in the push, or the latest
  commit message contains `DEPLOY=now`.
- The profile deploys when anything under `web/` changed in the push, or the
  message contains `DEPLOY=web`.
- Change detection diffs the **whole push range** (`github.event.before..HEAD`),
  so a change in any commit of a multi-commit push is caught. The `DEPLOY=`
  overrides remain as a manual force / redeploy switch.

## Directory map

- `weblog/pages/` — Markdown pages (`landing.md` is the homepage, `Location: /`).
  `weblog/*.md` — blog posts.
- `configuration/configuration.txt` — weblog config (nav, formats, etc.).
- `configuration/template.html` — the **default** page template (header, nav,
  footer). A page uses it unless its front matter sets `Template:` to a named
  template. **Named templates (e.g. "Landing Page Template", "Post Template")
  are defined in the omg.lol weblog dashboard, not in this repo.**
- `now/now.md` — now-page content.
- `web/` — profile source: `profile.txt` (omg.lol profile content),
  `head.html` (custom `<head>`), `css.css` (custom CSS).
- `script/` — the two deploy scripts.

## Gotchas

- **The `/web` POST resets every field you omit.** Sending only `content` wipes
  the profile's custom `<head>` and CSS. `deploy-web.sh` therefore always sends
  `content` + `css` + `head` together with `publish: true`. Keep all three
  `web/` files in sync; never POST content alone.
- **The homepage is `weblog/pages/landing.md`.** If it looks wrong, check that
  file and the `Navigation:` / template settings in `configuration.txt` — not
  the now page or the profile.
- Assets are served from `assets/` via raw.githack.com pinned to `main`
  (see `template.html` and `web/head.html`).

## Verify after deploy

```
curl -s https://lritter.io/            # weblog homepage
curl -s https://lritter.omg.lol        # profile page (check <head> + h-card)
curl -s https://lritter.omg.lol/now    # now page
```
