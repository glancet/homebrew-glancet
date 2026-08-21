# Glancet — Homebrew tap

Live status for your coding-agent sessions, in the MacBook notch. <https://glancet.io>

```sh
brew tap glancet/glancet
brew install --cask glancet
```

Apple silicon, macOS 13 (Ventura) or newer.

## Updating

Glancet updates itself through Sparkle, so the cask is marked `auto_updates true`
and `brew upgrade` leaves it alone by default. To move it with Homebrew anyway:

```sh
brew upgrade --cask --greedy glancet
```

## Uninstalling

Use **Remove Glancet…** in the app's menu before uninstalling. It unmerges the
hook entries Glancet added to each agent's own settings file (`~/.claude/settings.json`
and friends) — files this cask deliberately does not edit.

```sh
brew uninstall --cask glancet     # removes the app
brew uninstall --zap --cask glancet   # also removes preferences and ~/.glancet
```

A leftover hook entry is harmless if you skip that step: the forwarder gets
connection-refused and exits 0.
