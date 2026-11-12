class JiraCli < Formula
  desc "Small CLI for Jira Data Center: issues, search, time tracking, monthly report"
  homepage "https://github.com/nizom333/jira-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.1/jira-cli_0.1.1_darwin_arm64.tar.gz"
      sha256 "bb737b2668addc4bcd33b2084d2e4a158d028ff22cac8b95671258c8935f83d6"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.1/jira-cli_0.1.1_darwin_amd64.tar.gz"
      sha256 "12e011cc653fd4a76418efbb578d22e39ec44a852a6c3163e6394789dc1a6bdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.1/jira-cli_0.1.1_linux_arm64.tar.gz"
      sha256 "afdae1e3701e0b9f07279b1c1054b2afd3c7043527cf17d773e3740c53674e14"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.1.1/jira-cli_0.1.1_linux_amd64.tar.gz"
      sha256 "b17181caec9ddd7d8a86fe5d2b46d7ac2353c345e4eb87a904a466d606329cd0"
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
