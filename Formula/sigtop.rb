class Sigtop < Formula
  homepage "https://github.com/tbvdm/sigtop"
  head "https://github.com/tbvdm/sigtop.git"

  # Provide a stable source to work around a Homebrew bug; see
  # https://github.com/Homebrew/brew/issues/17333
  url "https://github.com/tbvdm/sigtop.git", tag: "v0.11.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
    man1.install "sigtop.1"
  end

  test do
    system "#{bin}/sigtop; test $? = 1"
  end
end
