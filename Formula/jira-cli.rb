class JiraCli < Formula
  desc "Small CLI for Jira Data Center: issues, search, time tracking, monthly report"
  homepage "https://github.com/nizom333/jira-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.2.0/jira-cli_0.2.0_darwin_arm64.tar.gz"
      sha256 "e82f4f63ae96ed969e4f754f01da62818685d8c5d75b67d5e4ccdae7695a0d7c"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.2.0/jira-cli_0.2.0_darwin_amd64.tar.gz"
      sha256 "2651779a5bfa055d1ce53c3bf90924a5e4f63889051cb1370e3bbda47d40a631"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.2.0/jira-cli_0.2.0_linux_arm64.tar.gz"
      sha256 "de048b637568ad4807cafe77a8b4adc114803d2380d5c7e46e98f2d95fd22cec"
    end
    on_intel do
      url "https://github.com/nizom333/jira-cli/releases/download/v0.2.0/jira-cli_0.2.0_linux_amd64.tar.gz"
      sha256 "78009574701e61f6e15b18a11e108cc47fe780f02930f204e2abca124dd76b6f"
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
