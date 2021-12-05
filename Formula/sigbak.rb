class Sigbak < Formula
  homepage "https://github.com/tbvdm/sigbak"
  head "https://github.com/tbvdm/sigbak.git", branch: "portable"

  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "libressl"
  depends_on "protobuf-c"
  depends_on "sqlite"

  def install
    ENV.prepend_path "PATH", Formula["make"].opt_libexec/"gnubin" if OS.mac?
    system "make", "PREFIX=#{prefix}", "MANDIR=#{man}", "install"
  end
end
