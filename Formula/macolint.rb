# Homebrew formula for Macolint
# This formula can be used in a custom tap
# Usage: brew tap p4puniya/macolint && brew install macolint

class Macolint < Formula
  desc "A terminal-first snippet manager with encrypted local storage"
  homepage "https://github.com/p4puniya/Macolint"
  url "https://github.com/p4puniya/Macolint.git", tag: "v0.1.0", revision: "284c2d0ceda1e5b963364c6d2a6a64e46ec07abc"
  license "MIT"
  head "https://github.com/p4puniya/Macolint.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--locked"
    bin.install "target/release/snip" => "snip"
  end

  test do
    system "#{bin}/snip", "--help"
  end
end

