class Spmsift < Formula
  desc "Context-efficient Swift Package Manager analysis tool for Claude agents"
  homepage "https://github.com/elkraneo/spmsift"
  url "https://github.com/elkraneo/spmsift/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "d07b004dbb14b57f58195b02731d28f2ee6dac9545fbf55fbe3c8ebef1a4d435"
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
