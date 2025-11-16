class Spmsift < Formula
  desc "Context-efficient Swift Package Manager analysis tool for Claude agents"
  homepage "https://github.com/elkraneo/spmsift"
  url "https://github.com/elkraneo/spmsift/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "44e557f550fb3e295c4afcc1a76aa666cd90262e7b8541861ae8671e81247f5a"
  license "MIT"
  head "https://github.com/elkraneo/spmsift.git", branch: "main"

  depends_on :xcode
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/spmsift"
    man1.install "spmsift.1"
  end

  test do
    test_json = '{"name": "Test", "targets": []}'
    output = pipe_output("#{bin}/spmsift", test_json)
    assert_match "dump-package", output
    assert_match "success", output

    # Test target-specific analysis
    target_json = '{"name": "Test", "targets": [{"name": "TestTarget", "type": "executable"}]}'
    target_output = pipe_output("#{bin}/spmsift --target TestTarget", target_json)
    assert_match "TestTarget", target_output
  end
end
