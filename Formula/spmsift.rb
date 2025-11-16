class Spmsift < Formula
  desc "Context-efficient Swift Package Manager analysis tool for Claude agents"
  homepage "https://github.com/elkraneo/spmsift"
  url "https://github.com/elkraneo/spmsift/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "82cc8e8809e8cfbbdbd78171c6aa4ad0417a4ba58d778b553be7f3edc0d6a21a"
  license "MIT"
  head "https://github.com/elkraneo/spmsift.git", branch: "main"

  depends_on :xcode
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--product", "spmsift"
    bin.install ".build/release/spmsift"
  end

  test do
    test_json = '{"name": "Test", "targets": []}'
    output = pipe_output("#{bin}/spmsift", test_json)
    assert_match '"command": "dump-package"', output
    assert_match '"success": true', output

    # Test target-specific analysis
    target_json = '{"name": "Test", "targets": [{"name": "TestTarget", "type": "executable"}]}'
    target_output = pipe_output("#{bin}/spmsift --target TestTarget", target_json)
    assert_match '"filteredTarget": "TestTarget"', target_output
  end
end
