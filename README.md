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

## License

MIT
