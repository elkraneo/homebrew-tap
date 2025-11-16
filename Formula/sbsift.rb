class Sbsift < Formula
  desc "Context-efficient Swift build analysis tool for Claude agents"
  homepage "https://github.com/elkraneo/sbsift"
  url "https://github.com/elkraneo/sbsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "02f7df09219ad62d2419436b01cfa0a02374c2eb1df21730a9db7ac6f9b76370"  # UPDATE THIS WITH ACTUAL SHA256
  license "MIT"
  head "https://github.com/elkraneo/sbsift.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/sbsift"
  end

  test do
    test_input = "Swift build output sample"
    output = pipe_output("#{bin}/sbsift --format summary", test_input)
    assert_match "sbsift", output
  end
end