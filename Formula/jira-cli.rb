class JiraCli < Formula
  desc "Small CLI for Jira Data Center: issues, search, time tracking, monthly report"
  homepage "https://github.com/nizom333/jira-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.4.0/jira-cli_0.4.0_darwin_arm64.tar.gz"
      sha256 "3785df36e86a39f877a643dbc47c28699fb000b9a5bdad6b19e3c2361150f2f3"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.4.0/jira-cli_0.4.0_darwin_amd64.tar.gz"
      sha256 "62b4c163bfd1363479709d45b3336a570212b0ad9b461890523e5cd50d4b423f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.4.0/jira-cli_0.4.0_linux_arm64.tar.gz"
      sha256 "e4c4977a2f2620e81b6b105a63a8f3c06d830cf176d3dbc7050cb9d5921b8dec"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.4.0/jira-cli_0.4.0_linux_amd64.tar.gz"
      sha256 "90bfedd6629d4d8972330f799594154e6a2a2f6e5cadbba1ec5e45b8dcad52d5"
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
