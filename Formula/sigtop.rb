class Sigtop < Formula
  homepage "https://github.com/tbvdm/sigtop"
  head "https://github.com/tbvdm/sigtop.git"

  depends_on "go" => :build

  on_linux do
    depends_on "libsecret"
  end

  def install
    system "go", "build", *std_go_args
    man1.install "sigtop.1"
  end

  test do
    system "#{bin}/sigtop; test $? = 1"
  end
end
