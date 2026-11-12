# homebrew-tap

Установка [jira-cli](https://github.com/nizom333/jira-cli) через менеджеры пакетов.

**Homebrew** (macOS, Linux):

```sh
brew install nizom333/tap/jira-cli
```

**Scoop** (Windows):

```sh
scoop bucket add nizom333 https://github.com/nizom333/homebrew-tap
scoop install jira-cli
```

После нового релиза jira-cli: `gh workflow run update -R nizom333/homebrew-tap -f version=X.Y.Z`
(или локально `./update.sh X.Y.Z` и коммит).
