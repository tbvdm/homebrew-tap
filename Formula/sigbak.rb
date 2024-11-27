class Sigbak < Formula
  homepage "https://github.com/tbvdm/sigbak"
  head "https://github.com/tbvdm/sigbak.git", branch: "portable"

  depends_on "pkgconf" => :build
  depends_on "libressl"
  depends_on "protobuf-c"

  uses_from_macos "sqlite"

  # Xcode provides GNU make 3.81, which is too old
  on_macos do
    depends_on "make" => :build
  end

  def install
    ENV.prepend_path "PATH", Formula["make"].opt_libexec/"gnubin" if OS.mac?
    system "make", "PREFIX=#{prefix}", "MANDIR=#{man}", "install"
  end

  test do
    system "#{bin}/sigbak; test $? = 1"
  end
end
