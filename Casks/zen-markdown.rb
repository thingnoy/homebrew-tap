cask "zen-markdown" do
  version "0.1.3"
  sha256 "76084b03dac3eb8bd3986a1f9ffc5569060ce1025cb6dc703f5cc68095ffe0c8"

  url "https://github.com/thingnoy/zen-markdown/releases/download/v#{version}/zen-markdown-macos-arm64.dmg"
  name "zen-markdown"
  desc "Fast, native markdown editor built with Rust + egui"
  homepage "https://github.com/thingnoy/zen-markdown"

  depends_on arch: :arm64

  app "zen-markdown.app"

  caveats <<~EOS
    zen-markdown is not notarized (no paid Apple Developer cert), so
    Gatekeeper blocks the first launch. After installing, run once:

      xattr -dr com.apple.quarantine "/Applications/zen-markdown.app"

    or right-click the app in Finder and choose Open.
  EOS

  zap trash: [
    "~/Library/Saved Application State/com.thingnoy.zen-markdown.savedState",
  ]
end
