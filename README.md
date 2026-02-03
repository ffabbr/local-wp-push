# WP Local Push

Push a WordPress theme or plugin from a local WordPress install to a remote host using `lftp` + an interactive `fzf` picker.

## Requirements

- `lftp`
- `fzf` (recommended; required for `push`)

On macOS:

```bash
brew install lftp fzf
```

## Install

### Option A: clone repo + run installer

```bash
git clone <YOUR_GITHUB_REPO_URL>
cd wp-local-push
./install.sh
```

If `wp-local-push` isn’t found after install, add this to `~/.zshrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## First-time setup (wizard)

Run:

```bash
wp-local-push setup
```

This will:

- Create a config file at `~/.config/wp-local-push/config`
- Add an FTP login entry to `~/.netrc`
- Create an `lftp` bookmark so you can connect via a short name

## Push a theme or plugin

```bash
wp-local-push push
```

Optional:

- `--dry-run` (show what would happen)
- `--delete` (delete remote files not present locally; use carefully)

## Troubleshooting

```bash
wp-local-push doctor
```

## Security notes

- Credentials are stored in `~/.netrc` and that file is set to permission `600`.
- If you don’t want the wizard to write credentials, you can create/edit `~/.netrc` yourself and then re-run `wp-local-push setup`.

## Publishing this on GitHub (your steps)

1. Create a new GitHub repository (e.g. `wp-local-push`).
2. In this folder:

```bash
git init
git add .
git commit -m "Initial release"
```

3. Add your GitHub remote and push:

```bash
git remote add origin git@github.com:<YOUR_USER>/<YOUR_REPO>.git
git branch -M main
git push -u origin main
```

4. (Optional) Create a GitHub Release so people can pin a version.
