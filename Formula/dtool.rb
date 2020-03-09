class Dtool < Formula
  desc "Command-line tool collection to assist development"
  homepage "https://github.com/guoxbin/dtool"
  url "https://github.com/guoxbin/dtool/archive/v0.9.0.tar.gz"
  sha256 "50cc164e9baf2262ae189c7986af3e1693479e708e38d6b6f36c6f8566593a22"

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
