class JiraCli < Formula
  desc "Small CLI for Jira Data Center: issues, search, time tracking, monthly report"
  homepage "https://github.com/nizom333/jira-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.0/jira-cli_0.1.0_darwin_arm64.tar.gz"
      sha256 "5b4b71f96e6a84d5fcdb97c694422f1cf35bb87b9052d0a55ee6f77ebafa8574"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.0/jira-cli_0.1.0_darwin_amd64.tar.gz"
      sha256 "2159443d21c889e68dc4e72dd8801c688ca0b38344ce7277a50f385227c34fbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.0/jira-cli_0.1.0_linux_arm64.tar.gz"
      sha256 "3be4ca0da6a88afe4d5002b36ac5a2b4189bcf2cb703052a296c3a3b42af5628"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.0/jira-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "55b4b6d35cab6f5217e0182f7763dde2e04c01a3ff11078cc288de018c780184"
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
