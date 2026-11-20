class JiraCli < Formula
  desc "Small CLI for Jira Data Center: issues, search, time tracking, monthly report"
  homepage "https://github.com/nizom333/jira-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.3.0/jira-cli_0.3.0_darwin_arm64.tar.gz"
      sha256 "f22fa137ee15727e8eaa385daff75a768d05bc4555b5aab9409ff7ad245c1c6c"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.3.0/jira-cli_0.3.0_darwin_amd64.tar.gz"
      sha256 "a190a31f3483fe8b4968c2e367fbd08823e67db36624377e8fb3398f12294657"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.3.0/jira-cli_0.3.0_linux_arm64.tar.gz"
      sha256 "27d1265d890b07e8daf00da6b89959b0fc619d9e32bbf64221d4d83e6ec8127e"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.3.0/jira-cli_0.3.0_linux_amd64.tar.gz"
      sha256 "f1d493f988ec9b539806dde01d2fccd36fb9b305493bb7d2389102e604b2d7ea"
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
