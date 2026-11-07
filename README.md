# Homebrew tap

Apps from [github.com/bhaskar0210s](https://github.com/bhaskar0210s), for Macs with Apple silicon.

```sh
brew install bhaskar0210s/tap/crumb
brew install bhaskar0210s/tap/pounce
```

| Cask | |
| --- | --- |
| [crumb](Casks/crumb.rb) | [Crumb](https://github.com/bhaskar0210s/crumb), a tiny clipboard history: press ⇧⌘C anywhere for everything you copied. |
| [pounce](Casks/pounce.rb) | [Pounce](https://github.com/bhaskar0210s/pounce), a small, fast app launcher: press ⌘Space, type a few letters of an app, press Return. Does sums too. |

The casks install each app's latest release from its own repository. These apps aren't notarized by Apple, so the casks clear
the quarantine flag on the installed app, and macOS opens it without asking whether it is free of malware.
