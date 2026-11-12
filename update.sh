#!/usr/bin/env bash
# Обновляет формулу Homebrew и манифест Scoop под релиз jira-cli:  ./update.sh 0.1.0
set -euo pipefail
version="${1:?использование: ./update.sh ВЕРСИЯ (например 0.1.0)}"
version="${version#v}"
repo="nizom333/jira-cli"
base="https://github.com/${repo}/releases/download/v${version}"
sums="$(curl -fsSL "${base}/checksums.txt")"

sum() { # sha256 архива по его имени
  local s
  s="$(awk -v f="$1" '$2 == f || $2 == "*" f { print $1 }' <<<"$sums")"
  [ -n "$s" ] || { echo "в checksums.txt нет $1" >&2; exit 1; }
  echo "$s"
}
file() { echo "jira-cli_${version}_$1_$2.$3"; }

cd "$(dirname "$0")"
mkdir -p Formula bucket

cat > Formula/jira-cli.rb <<RUBY
class JiraCli < Formula
  desc "Small CLI for Jira Data Center: issues, search, time tracking, monthly report"
  homepage "https://github.com/${repo}"
  version "${version}"
  license "MIT"

  on_macos do
    on_arm do
      url "${base}/$(file darwin arm64 tar.gz)"
      sha256 "$(sum "$(file darwin arm64 tar.gz)")"
    end
    on_intel do
      url "${base}/$(file darwin amd64 tar.gz)"
      sha256 "$(sum "$(file darwin amd64 tar.gz)")"
    end
  end

  on_linux do
    on_arm do
      url "${base}/$(file linux arm64 tar.gz)"
      sha256 "$(sum "$(file linux arm64 tar.gz)")"
    end
    on_intel do
      url "${base}/$(file linux amd64 tar.gz)"
      sha256 "$(sum "$(file linux amd64 tar.gz)")"
    end
  end

  def install
    bin.install "jira"
    pkgshare.install "SKILL.md"
  end

  def caveats
    <<~EOS
      First run:  jira login

      Claude Code skill (optional):
        mkdir -p ~/.claude/skills/jira && cp #{opt_pkgshare}/SKILL.md ~/.claude/skills/jira/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jira version")
  end
end
RUBY

cat > bucket/jira-cli.json <<JSON
{
  "version": "${version}",
  "description": "Small CLI for Jira Data Center: issues, search, time tracking, monthly report",
  "homepage": "https://github.com/${repo}",
  "license": "MIT",
  "architecture": {
    "64bit": {
      "url": "${base}/$(file windows amd64 zip)",
      "hash": "$(sum "$(file windows amd64 zip)")"
    },
    "arm64": {
      "url": "${base}/$(file windows arm64 zip)",
      "hash": "$(sum "$(file windows arm64 zip)")"
    }
  },
  "bin": "jira.exe",
  "notes": "First run: jira login"
}
JSON
echo "обновлено до ${version}"
