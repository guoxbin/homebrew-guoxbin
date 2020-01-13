class Dtool < Formula
  desc "Command-line tool collection to assist development"
  homepage "https://github.com/guoxbin/dtool"
  url "https://github.com/guoxbin/dtool/archive/v0.6.0.tar.gz"
  sha256 "7e1c6cc9581da3b92bf3ec0e9cd88156d722e05a1691ccb0c72653a7194382a0"

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
