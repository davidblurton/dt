# dt

Manage [dtach](https://github.com/crigler/dtach) sessions by name. Like a tiny tmux:
detachable shells you reach by name, with a liveness-aware list.

```
dt              list sessions (dead = stale socket)
dt work         attach to "work", creating it if absent
dt -k work      kill session(s) and remove the socket
dt -h           help
dt -v           version
```

The positional argument is always a session name, so names never clash with
subcommands — `dt ls` attaches to a session called `ls`. Detach with `Ctrl-\`.

Sockets live in `~/.dtach` (override with `$DT_DIR`). Liveness is a real unix-socket
`connect()` via `nc -U`, so a stale socket left by a crashed master shows as `(dead)`.

## Install (Homebrew)

```sh
brew install davidblurton/tap/dt
```

This pulls in `dtach` automatically. To install straight from `main` without waiting on
a tagged release:

```sh
brew install --HEAD davidblurton/tap/dt
```

## Install (manual)

```sh
brew install dtach
curl -fsSL https://raw.githubusercontent.com/davidblurton/dt/main/bin/dt -o /usr/local/bin/dt
chmod +x /usr/local/bin/dt
```

Needs `dtach`, plus `nc` and `lsof` (both ship with macOS). Shell-agnostic — it runs as
an executable, not a shell function, so it works regardless of which shell you use.

## Releasing

Releases are fully automated. Tag and push:

```sh
git tag vX.Y.Z
git push origin vX.Y.Z
```

The `release` workflow then:

1. cuts a GitHub release with generated notes, and
2. bumps the formula in [`davidblurton/homebrew-tap`](https://github.com/davidblurton/homebrew-tap)
   — computing the tarball `sha256` and committing the new `url`/`sha256` to `Formula/dt.rb`.

After that, `brew install davidblurton/tap/dt` serves the new version. There is no manual
hashing step; never edit the tap formula's `sha256` by hand.

Keep `bin/dt`'s `VERSION` in sync with the tag you push. The `Formula/dt.rb` in *this* repo
is only a reference template — the tap repo holds the live formula brew installs.

### One-time setup

The tap bump needs a repo secret `TAP_GITHUB_TOKEN`: a fine-grained PAT scoped to the
`homebrew-tap` repo with **Contents: read and write**.

```sh
gh secret set TAP_GITHUB_TOKEN --repo davidblurton/dt
```

## License

MIT
