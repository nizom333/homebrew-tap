# homebrew-tap

Homebrew tap and Scoop bucket for [nizom333](https://github.com/nizom333) tools.

| Tool | What it is | Homebrew (macOS, Linux) | Scoop (Windows) |
|---|---|---|---|
| [bdv](https://github.com/nizom333/bdv) | Terminal UI viewer for the beads (`bd`) issue tracker | `brew install nizom333/tap/bdv` | `scoop install bdv` |
| [jira-cli](https://github.com/nizom333/jira-cli) | CLI for Jira | `brew install nizom333/tap/jira-cli` | `scoop install jira-cli` |

**Scoop** needs the bucket once:

```sh
scoop bucket add nizom333 https://github.com/nizom333/homebrew-tap
```

`bdv` is published here automatically by GoReleaser on every release (`Casks/bdv.rb`, `bucket/bdv.json`).
After a new jira-cli release: `gh workflow run update -R nizom333/homebrew-tap -f version=X.Y.Z` (or `./update.sh X.Y.Z` locally and commit).
