class Sbsift < Formula
  desc "A+ Grade Swift Build Analysis Tool with 90%+ context reduction"
  homepage "https://github.com/elkraneo/sbsift"
  url "https://github.com/elkraneo/sbsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "02f7df09219ad62d2419436b01cfa0a02374c2eb1df21730a9db7ac6f9b76370"
  license "MIT"
  head "https://github.com/elkraneo/sbsift.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/sbsift"

    # Install manual page
    man1.install "docs/sbsift.1" if File.exist?("docs/sbsift.1")

    # Install shell completion scripts if available
    bash_completion.install "scripts/completion/bash/sbsift" if File.exist?("scripts/completion/bash/sbsift")
    zsh_completion.install "scripts/completion/zsh/_sbsift" if File.exist?("scripts/completion/zsh/_sbsift")
  end

  test do
    # Test basic functionality
    test_input = "Building for debug...\nCompiling Swift module 'MyTarget'\nBuild complete!"

    # Test normal output
    output = pipe_output("#{bin}/sbsift", test_input)
    assert_match "command", output
    assert_match "success", output

    # Test compact output
    compact_output = pipe_output("#{bin}/sbsift --compact", test_input)
    assert_match "cmd", compact_output
    assert_match "ok", compact_output

    # Test minimal output
    minimal_output = pipe_output("#{bin}/sbsift --minimal", test_input)
    assert_match "c", minimal_output
    assert_match "s", minimal_output

    # Test help command
    help_output = shell_output("#{bin}/sbsift --help")
    assert_match "context-efficient", help_output
    assert_match "compact", help_output
    assert_match "minimal", help_output
    assert_match "monitor", help_output
  end
end