class Spmsift < Formula
  desc "Context-efficient Swift Package Manager analysis tool for Claude agents"
  homepage "https://github.com/elkraneo/spmsift"
  url "https://github.com/elkraneo/spmsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6b068565ded43cf90c35673445839f3163cd74a1644fb4cb94bfd7f67eb1a611"
  license "MIT"
  head "https://github.com/elkraneo/spmsift.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/spmsift"
  end

  test do
    test_input = '{"name": "test", "platforms": ["iOS"]}'
    output = pipe_output("#{bin}/spmsift --format summary", test_input)
    assert_match "spmsift", output
  end
end
