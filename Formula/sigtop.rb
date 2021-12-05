class Sigtop < Formula
  homepage "https://github.com/tbvdm/sigtop"
  head "https://github.com/tbvdm/sigtop.git", branch: "portable"

  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "libressl"

  def install
    ENV.prepend_path "PATH", Formula["make"].opt_libexec/"gnubin" if OS.mac?
    system "make", "PREFIX=#{prefix}", "MANDIR=#{man}", "install"
  end
end
