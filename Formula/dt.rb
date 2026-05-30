class Dt < Formula
  desc "Manage dtach sessions by name"
  homepage "https://github.com/davidblurton/dt"
  url "https://github.com/davidblurton/dt/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_TARBALL_SHA256"
  license "MIT"
  head "https://github.com/davidblurton/dt.git", branch: "main"

  depends_on "dtach"

  def install
    bin.install "bin/dt"
    bash_completion.install "completions/dt.bash" => "dt"
    zsh_completion.install "completions/dt.zsh" => "_dt"
    fish_completion.install "completions/dt.fish" => "dt.fish"
  end

  test do
    ENV["DT_DIR"] = testpath/"sessions"
    assert_equal "no sessions", shell_output("#{bin}/dt ls").strip
  end
end
