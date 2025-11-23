class Dtool < Formula
  desc "Command-line tool collection to assist development"
  homepage "https://github.com/guoxbin/dtool"
  url "https://github.com/guoxbin/dtool/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "62d79d02573df83bf90e7c857453536ed4b84c9cc47021b31d9e1504a8b90808"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    system "#{bin}/dtool completion -s bash > dtool.bash"
    system "#{bin}/dtool completion -s zsh > _dtool"
    system "#{bin}/dtool completion -s fish > dtool.fish"

    bash_completion.install "dtool.bash"
    zsh_completion.install "_dtool"
    fish_completion.install "dtool.fish"
  end

  test do
    assert_match "0x61626364", shell_output("#{bin}/dtool s2h abcd")
  end
end
