class BashGitPrompt < Formula
  desc "Informative, fancy bash prompt for Git users"
  homepage "https://github.com/magicmonty/bash-git-prompt"
  url "https://github.com/magicmonty/bash-git-prompt/archive/2.6.1.tar.gz"
  sha256 "d2e58eaaae521cbcf3758a38cbc9233ea2e24a47dd907e64cdb514f30bd7b9ed"
  head "https://github.com/magicmonty/bash-git-prompt.git"

  bottle :unneeded

  def install
    share.install "gitprompt.sh", "gitprompt.fish", "git-prompt-help.sh",
                  "gitstatus.py", "gitstatus.sh", "gitstatus_pre-1.7.10.sh",
                  "prompt-colors.sh"

    (share/"themes").install Dir["themes/*.bgptheme"], "themes/Custom.bgptemplate"
    doc.install "README.md"
  end

  def caveats; <<-EOS.undent
    You should add the following to your .bashrc (or equivalent):
      if [ -f #{HOMEBREW_PREFIX}/share/gitprompt.sh ]; then
        GIT_PROMPT_THEME=Default
        . #{HOMEBREW_PREFIX}/share/gitprompt.sh
      fi
    EOS
  end
end
